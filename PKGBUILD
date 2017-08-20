# Maintainer: fenuks

_pkgname=gtk-wave-cleaner
pkgname=gwc
pkgver=0.22
pkgrel=2
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
source=("http://downloads.sourceforge.net/project/gwc/gwc2/${pkgver}/${_pkgname}-${pkgver}.tar.gz"
)

sha256sums=('56e44400082672dc5df655fb1517cfc4af6fb00b75f8930f4c721f1c8c1e6122')

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    ./configure --prefix=/usr
}

build() {
    cd "$srcdir/${_pkgname}-${pkgver}"
    make
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}/" install
    rm -f "${pkgdir}/usr/share/icons/hicolor/icon-theme.cache"
}
