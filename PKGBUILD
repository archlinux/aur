# Maintainer: fenuks

_pkgver=0.22
_pkgrel=04
_file=gtk-wave-cleaner-${_pkgver}-${_pkgrel}
pkgname=gwc
pkgver=${_pkgver}_${_pkgrel}
pkgrel=2
pkgdesc="Gtk Wave Cleaner is a digital audio editor to denoise, dehiss and amplify audio files"
arch=("i686" "x86_64")
url="http://gwc.sourceforge.net/"
license=("GPL")
depends=("libsndfile" "gtk2" "fftw")
optdepends=("vorbis-tools: for ogg export"
            "lame: for mp3 export")
makedepends=("make")
provides=("${pkgname}")
conflicts=("${pkgname}")
# install=$pkgname.install
source=("https://github.com/AlisterH/gwc/releases/download/${_pkgver}-${_pkgrel}/${_file}.tar.gz")
sha256sums=('0107c3a0c6074e03f7f5fca8eb4ea0d8e7f47d574b1c5df4fcc4a4418c1ab64a')

prepare() {
    cd "${srcdir}/${_file}"
    LDFLAGS="-Xlinker --allow-multiple-definition" ./configure --prefix=/usr
}

build() {
    cd "${srcdir}/${_file}"
    make || make # fixes problem with missing generated machine.h
}

package() {
    cd "${srcdir}/${_file}"
    make DESTDIR="${pkgdir}/" install
    rm -f "${pkgdir}/usr/share/icons/hicolor/icon-theme.cache"
}
