# Maintainer: fenuks

_pkgver=0.22
_pkgrel=04
pkgname=gwc
pkgver=${_pkgver}_${_pkgrel}
pkgrel=1
pkgdesc="Gtk Wave Cleaner is a digital audio editor to denoise, dehiss and amplify audio files"
arch=("i686" "x86_64")
url="http://gwc.sourceforge.net/"
license=("GPL")
depends=("libsndfile" "gtk2" "fftw")
optdepends=("vorbis-tools: for ogg support"
            "lame: for mp3 support")
makedepends=("make")
provides=("${pkgname}")
conflicts=("${pkgname}")
# install=$pkgname.install
source=("https://github.com/AlisterH/gwc/archive/${_pkgver}-${_pkgrel}.tar.gz")

sha256sums=('2e1bb6d839a683d36c1d64775c847dba77222dca1c1205350d34196a20527022')

prepare() {
    cd "${srcdir}/${pkgname}-${_pkgver}-${_pkgrel}"
    autoreconf -ifv
    ./configure --prefix=/usr
}

build() {
    cd "${srcdir}/${pkgname}-${_pkgver}-${_pkgrel}"
    make
}

package() {
    cd "${srcdir}/${pkgname}-${_pkgver}-${_pkgrel}"
    make DESTDIR="${pkgdir}/" install
    rm -f "${pkgdir}/usr/share/icons/hicolor/icon-theme.cache"
}
