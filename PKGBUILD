# Maintainer: Caleb Woodbine <calebwoodbine.public@gmail.com>
pkgname=safesurfer-desktop
pkgver=1.0.0b3
pkgrel=1
pkgdesc="Keep safe in the digitial surf with Safe Surfer."
arch=('x86_64')
url="https://gitlab.com/safesurfer/SafeSurfer-Desktop"
license=('GPL')
makedepends=(npm nodejs)
depends=(polkit curl)
source=("https://gitlab.com/safesurfer/SafeSurfer-Desktop/-/archive/${pkgver}/SafeSurfer-Desktop-${pkgver}.zip")
md5sums=('SKIP')

prepare() {
	cd "SafeSurfer-Desktop-$pkgver"
	npm install
}

build() {
	cd "SafeSurfer-Desktop-$pkgver"
	make PACKAGEFORMAT=arch build-linux
}

package() {
	cd "SafeSurfer-Desktop-$pkgver"
	make DESTDIR="$pkgdir/" install
}

post_remove() {
	rm -rf /opt/SafeSurfer-Desktop
}
