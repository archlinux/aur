pkgname=lightningstream
pkgver=0.5.0
pkgrel=3
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
sha512sums=('06516b7dd447477d7ab0d25a0c53b5795be480fafede3b535ecb8706a1b58a1aef00f2bee3e3d1d68868b78111747c30bf082cf26f9e9ae34ac1ff382b84de11'
            '4afd7c410f10bf74ce158d0fe7706f5e58e78093dd0fe699857dea938507a783c25a8d0e54cf7f1f18efca216fc0b7c18ef0df3dcec5d2ae91d6eccbea7c7f3c')
b2sums=('426d74ca5b6cd26be61d5a2383936a2a3865631ab7a9003e9a596ba98d85636f5e74b3c326de72fc290e32c12d1eec136535be29409ddbc6a57208c479879f32'
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
