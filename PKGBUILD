# Maintainer: Patrick Burroughs (Celti) <celti@celti.name>

pkgname='heimdall-cli-git'
pkgver() { cd $pkgname && git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'; }
pkgver=1.4.1.r21.gd0526a3
pkgrel=1
pkgdesc='A cross-platform open-source tool to flash firmware onto Samsung Galaxy devices.'
arch=('i686' 'x86_64')
url='http://www.glassechidna.com.au/products/heimdall/'
license=('MIT')
depends=('libusb')
makedepends=('cmake' 'git')
optdepends=('android-udev: udev rules to connect Android devices')
conflicts=('heimdall')
provides=('heimdall')
source=("$pkgname::git+https://github.com/Benjamin-Dobell/Heimdall.git")
sha256sums=('SKIP')

prepare() {
	cd ${pkgname}
	rm -rf build && mkdir build && cd build
	cmake -DCMAKE_BUILD_TYPE=Release -DDISABLE_FRONTEND=ON ..
}

build() {
	cd ${pkgname}
	cd build && make
}

package() {
	cd ${pkgname}
	install -Dm755 build/bin/heimdall "${pkgdir}/usr/bin/heimdall"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
