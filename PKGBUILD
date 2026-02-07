pkgname=lightningstream
pkgver=0.5.3
pkgrel=1
pkgdesc='Lightning Stream syncs LMDB databases through S3 buckets between multiple servers, including PowerDNS Authoritative server 4.8+ LMDBs.'
arch=('x86_64' 'aarch64')
url='https://github.com/PowerDNS/lightningstream'
license=('MIT')
makedepends=('git' 'lmdb' 'go')
backup=('etc/lightningstream.yml')
source=(
  "$pkgname::git+$url#tag=v$pkgver"
  "lightningstream.service"
)
sha512sums=('7167094e6b524fb0f1c25134253ce7e47e1c8633ff46c34e0e898d909a593ed68b801ad8d745bd527487378a09d8971675ccf853386e83cb58ddd57504dfc4ae'
            '4afd7c410f10bf74ce158d0fe7706f5e58e78093dd0fe699857dea938507a783c25a8d0e54cf7f1f18efca216fc0b7c18ef0df3dcec5d2ae91d6eccbea7c7f3c')
b2sums=('c77401e56096ed2f87314c6c139542cf5ba21a93f0bd207db410d5615d0c43fc06d7b2bf6ae42ddf1f3502a8dfa79f430eacb1b10be757c4aee554f7fdde0a51'
        '017d1aab9d4de6d479a2bbbfcee03404bf3f6ce7f86c7a7523b6305be329b87eccecdb6efd8601e0d335cdf4bc87229c46273c43daba53c16df52a5165356d65')

build() {
  cd $srcdir/$pkgname
  go build -o bin/$pkgname ./cmd/$pkgname
}

package() {
  cd $srcdir/$pkgname
  install -vDm655 bin/$pkgname $pkgdir/usr/bin/$pkgname

  # example config
  install -vDm644 example.yaml $pkgdir/etc/lightningstream.yml

  # service
  install -vDm644 $srcdir/$pkgname.service $pkgdir/usr/lib/systemd/system/$pkgname.service

  # license
  install -vDm644 LICENSE "$pkgname/LICENSE"
}
