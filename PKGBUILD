# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: jospehgbr <rafael.f.f1@gmail.com>

_pkgbase=libass
pkgname=lib32-${_pkgbase}
pkgver=0.10.1
pkgrel=2
pkgdesc="A portable library for SSA/ASS subtitles rendering (32 bit)"
arch=('x86_64')
url="https://github.com/libass/libass/"
license=('BSD')
depends=("${_pkgbase}"
'lib32-enca' 'lib32-fontconfig' 'lib32-fribidi' 'lib32-harfbuzz')
makedepends=('gcc-multilib')
source=("http://libass.googlecode.com/files/${_pkgbase}-${pkgver}.tar.xz")
md5sums=('0f54b1f3a24fa897ebbbcc5bc744b32a')

build() {
  export CC='gcc -m32'  
  cd ${_pkgbase}-${pkgver}
  ./configure --prefix=/usr --libdir=/usr/lib32 \
	--enable-enca \
	--enable-harfbuzz \
	--enable-fontconfig
  make
}

package() {
  make -C ${_pkgbase}-${pkgver} DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/include
  install -dm755 "${pkgdir}"/usr/share/licenses
  ln -s ${_pkgbase} "${pkgdir}"/usr/share/licenses/${pkgname}
}
