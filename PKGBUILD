# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: jospehgbr <rafael.f.f1@gmail.com>

_pkgbase=libass
pkgname=lib32-${_pkgbase}
pkgver=0.12.2
pkgrel=2
pkgdesc="A portable library for SSA/ASS subtitles rendering (32 bit)"
arch=('x86_64')
url="https://github.com/libass/libass/"
license=('BSD')
depends=("${_pkgbase}"
'lib32-enca' 'lib32-fontconfig' 'lib32-fribidi' 'lib32-harfbuzz')
makedepends=('gcc-multilib' 'yasm')
source=("${url}/releases/download/${pkgver}/${_pkgbase}-${pkgver}.tar.xz")
md5sums=('d4b78e6a0794a9d386ece5cd08eb2d3e')

build() {
  export CC='gcc -m32'
  cd "$srcdir/${_pkgbase}-${pkgver}"
  ./configure --prefix=/usr --libdir=/usr/lib32 --host=i686-linux-gnu \
	--enable-enca \
	--enable-harfbuzz \
	--enable-fontconfig
  make
}

package() {
  cd "$srcdir/${_pkgbase}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/include
  install -dm755 "${pkgdir}"/usr/share/licenses
  ln -s ${_pkgbase} "${pkgdir}"/usr/share/licenses/${pkgname}
}
