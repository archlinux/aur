pkgname=lightningstream
pkgver=0.5.0
pkgrel=2
pkgdesc='Lightning Stream syncs LMDB databases through S3 buckets between multiple servers, including PowerDNS Authoritative server 4.8+ LMDBs.'
arch=('x86_64' 'aarch64')
url='https://github.com/PowerDNS/lightningstream'
license=('MIT')
makedepends=('git' 'lmdb' 'go')
backup=('etc/lightningstream.yml')
source=(
  "$pkgname::git+$url#tag=v$pkgver"
)
sha512sums=('06516b7dd447477d7ab0d25a0c53b5795be480fafede3b535ecb8706a1b58a1aef00f2bee3e3d1d68868b78111747c30bf082cf26f9e9ae34ac1ff382b84de11')
b2sums=('426d74ca5b6cd26be61d5a2383936a2a3865631ab7a9003e9a596ba98d85636f5e74b3c326de72fc290e32c12d1eec136535be29409ddbc6a57208c479879f32')

build() {
  cd $srcdir/$pkgname
  go build -o bin/$pkgname ./cmd/$pkgname
}

package() {
  cd $srcdir/$pkgname
  install -vDm655 bin/$pkgname $pkgdir/usr/bin/$pkgname

  # example config
  install -vDm644 example.yaml $pkgdir/etc/lightningstream.yml

  # license
  install -vDm644 LICENSE "$pkgname/LICENSE"
}
