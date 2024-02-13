# Maintainer: Robert Pannick <rwpannick@gmail.com>
# Contributor: Colean <colean@colean.cc>
pkgname=bipscript
pkgver=0.19
pkgrel=1
pkgdesc="A scripting language for interactive music"
arch=('i686' 'x86_64' 'x86_64_v3')
url="http://www.bipscript.org"
license=('GPL')
groups=('pro-audio')
depends=('boost-libs' 'fftw' 'lilv' 'liblo' 'libsndfile' 'portsmf')
makedepends=('cmake' 'boost' 'lv2' 'jack2' 'git')
provides=("bipscript")
conflicts=("bipscript")
source=("$pkgname"::"git+https://gitlab.domainepublic.net/bipscript/bipscript.git"
        "${pkgname}-v19.patch"
      )
sha256sums=('SKIP'
            '5e0794a2d00ad631e76ac3921058681c0e1df31a61dcdd3574b3097d0ed11cea')

prepare() {
  cd "${pkgname}"
  patch -Np1 -i "../${pkgname}-v19.patch"
}

build() {
	cd "$pkgname"
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release .
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
}
