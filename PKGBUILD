# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=nodejs-svgo-git
pkgver=4.0.0.r4.gcc489c2f
pkgrel=1
pkgdesc="Node.js tool for optimizing SVG files"
arch=('any')
url="https://github.com/svg/svgo"
license=('MIT')
depends=('nodejs')
makedepends=('git' 'npm')
provides=("nodejs-svgo=$pkgver")
conflicts=('nodejs-svgo')
source=("git+https://github.com/svg/svgo.git")
sha256sums=('SKIP')


pkgver() {
  cd "svgo"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "svgo"

  _package="$(npm pack)"
  npm install -g --prefix="$pkgdir/usr" "$_package"

  find "$pkgdir/usr" -type d -exec chmod 755 {} +
  chown -R root:root "$pkgdir"

  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/nodejs-svgo"
}
