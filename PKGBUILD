# Maintainer : Martin Wimpress <code@flexion.org>
# Contributor: Foster McLane <fkmclane@gmail.com>
# Contributor: Jonathan Thomas <jonathan@openshot.org>

pkgname=libopenshot-audio
pkgver=0.1.8
pkgrel=2
pkgdesc="A high-quality audio editing and playback library used by libopenshot."
arch=('x86_64')
url="https://openshot.org/"
license=('GPL3')
depends=('alsa-lib' 'freetype2' 'libxcursor' 'libxinerama' 'libxrandr')
makedepends=('cmake' 'doxygen')
source=("$pkgname-$pkgver.tar.gz::https://github.com/OpenShot/libopenshot-audio/archive/v$pkgver.tar.gz"
	"$pkgname-pr-39.patch::https://patch-diff.githubusercontent.com/raw/OpenShot/libopenshot-audio/pull/39.patch")
sha256sums=('384d0ef39c78f16d77048de3c96152321724084f978dc622675dd6bb16e15e19'
            'ae784a96730f7cf09ba7bf29d06704ba6a0eca662d242d786b0a86a4343e9dc9')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	patch -p1 -i "$srcdir/$pkgname-pr-39.patch"
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	mkdir build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	cd build
	make DESTDIR="${pkgdir}" install
}
