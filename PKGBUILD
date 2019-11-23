# maintainer: BrainDamage
pkgname=drmr-falktx
_basename="${pkgname%-falktx}"
pkgver=0.1
pkgrel=1
pkgdesc='DrMr is a LV2 sampler plugin that can play Hydrogen drumkits. This version enables plugin state saving using strings.'
arch=('x86_64')
license=('GPL')
url='https://github.com/falkTX/drmr'
groups=('lv2-plugins' 'pro-audio')
depends=('libsndfile' 'libsamplerate' 'expat' 'lv2')
makedepends=('gtk2' 'cmake')
optdepends=('gtk2: For the builtin GUI')
provides=("${_basename}")
conflicts=("${_basename}")
source=("https://github.com/falkTX/${_basename}/archive/v${pkgver}.tar.gz")
sha256sums=('6c8fb3daacf3d9f847301a8483395a7070794de7f474e4d732c9f3c590cda407')

build() {
	cd "${srcdir}/${_basename}-${pkgver}"
	mkdir -p build_dir
	cd build_dir
	cmake ../	\
		-DCMAKE_BUILD_TYPE=RelWithDebInfo \
		-DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "${srcdir}/${_basename}-${pkgver}"
	cd build_dir
	make DESTDIR="${pkgdir}/" install
}
