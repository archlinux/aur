# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=vot-cli-git
pkgver=1.1.1.r2.g479330d
pkgrel=1
pkgdesc="The voice-over translation of the video is now available not only in YandexBrowser."
arch=('x86_64' 'aarch64')
url="https://github.com/FOSWLY/vot-cli"
license=('MIT')
depends=('nodejs>=17')
makedepends=('git' 'npm')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
b2sums=('SKIP')

pkgver() {
	cd ${pkgname%-git}
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd ${pkgname%-git}


  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" ${pkgname%-git}@$_npmver
}
