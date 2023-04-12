# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=nodejs-svgo-git
pkgver=3.0.2.r3.g73f7002
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

  npm install -g --user root --prefix="$pkgdir/usr" git+file://$(pwd)
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/nodejs-svgo"

  find "$pkgdir/usr" -type d -exec chmod 755 {} +
  chown -R root:root "$pkgdir"
}
