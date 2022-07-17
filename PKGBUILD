# Maintainer: Sergey Kostyuchenko <derfenix@gmail.com>

pkgname=corectrl
pkgver=1.2.4
pkgrel=1
pkgdesc="Core control application"
url="https://gitlab.com/corectrl/corectrl"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('procps-ng' 'hwdata' 'karchive' 'kauth' 'qt5-charts' 'qt5-quickcontrols2' 'qt5-base>=5.9' 'botan>=2.2.0' 'qt5-svg' 'qt5-xmlpatterns' 'qt5-base')
makedepends=('cmake>=3.3' 'qt5-tools' 'karchive' 'gcc>=8' 'extra-cmake-modules')
optdepends=(
	'vulkan-tools: For vulkaninfo'
	'mesa-utils: For glxinfo',
	'util-linux: For lscpu'
)
source=("https://gitlab.com/corectrl/corectrl/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2")
sha512sums=('35d4211d7deeb9538c52d953be0cb560d92cda6bb924dd4a186dce77e2de944020ffcddad7debd7241851ec8a50d4fa8d28677b343686febda66a6d140692bce')

build() {
  rm -rf build
  cmake -B build -S "$pkgname-v$pkgver" \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DBUILD_TESTING=OFF \
  -Wno-dev
  make -C build
}


package() {
  make -C build DESTDIR="$pkgdir" install
}
