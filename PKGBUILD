pkgname=lightningstream
pkgver=0.5.1
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
sha512sums=('5acc3521c7addce1480c21d4a3893506f550bab325d2b105b8782c296f89e52cff1e4bd0ab86afcf4eaeebf37c0e9ae9215dfed915071dbf69b798e8bb5b8de2'
            '4afd7c410f10bf74ce158d0fe7706f5e58e78093dd0fe699857dea938507a783c25a8d0e54cf7f1f18efca216fc0b7c18ef0df3dcec5d2ae91d6eccbea7c7f3c')
b2sums=('05b5047b265ff25ebc919b033e0fab3cfe2bb8da358306178872b878e0c368731a368c52f17d90338409941aab7584f41b18f8cc20a1683e9d192e359c4142da'
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
