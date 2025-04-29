# Maintainer: Vinay <vinayydv3695@github.com>

pkgname=telecord
pkgver=1.0.0
pkgrel=1
pkgdesc="Export Discord chat from JSON to Telegram including media, via CLI"
arch=('any')
url="https://github.com/vinayydv3695/telecord"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vinayydv3695/telecord/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e0ddcdb64bf04b441acd0285e842742aa58359586965ccb6382cdb1900159dd5')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  npm install --production
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Install telecord binary
  install -Dm755 bin/telecord.js "$pkgdir/usr/bin/telecord"


  # Install the rest of the project
  mkdir -p "$pkgdir/usr/lib/$pkgname"
  cp -r assets lib node_modules package.json package-lock.json telecord.js "$pkgdir/usr/lib/$pkgname"

  # Optional: Install README and LICENSE if you have one
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
