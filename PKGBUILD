# Maintainet: GordonGR <ntheo1979@gmail.com>
# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: jospehgbr <rafael.f.f1@gmail.com>

_pkgname=libass
pkgname=lib32-${_pkgname}
pkgver=0.14.0
pkgrel=1
pkgdesc="A portable library for SSA/ASS subtitles rendering (32 bit)"
arch=('x86_64')
url='https://github.com/libass/libass/'
license=('BSD')
depends=("${_pkgbase}" 'lib32-fontconfig' 'lib32-fribidi' 'lib32-harfbuzz' 'lib32-glibc' 'lib32-glib2')
provides=('libass.so')
makedepends=('gcc-multilib' 'nasm')
source=("${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}.tar.xz")
md5sums=('5b8c23340654587b8a472cb74ee9366b')

build() {
export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
export CC='gcc -m32'
cd "${_pkgname}-${pkgver}"
./configure --prefix=/usr --libdir=/usr/lib32 --host=i686-linux-gnu \
	--enable-harfbuzz \
	--enable-fontconfig
make
}

package() {
cd "${_pkgname}-${pkgver}"
make DESTDIR="${pkgdir}" install
install -Dm 644 COPYING -t "${pkgdir}"/usr/share/licenses/${pkgname}/
rm -rf "${pkgdir}"/usr/include
}
