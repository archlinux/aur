# Maintainer: David Adler <d.adler@posteo.de>
# Contributor: Albert Graef <aggraef at gmail dot com>
# Contributor: David Runge <dave@sleepmap.de>

_pkgname=yoshimi
pkgname=$_pkgname-git
pkgver=r1777.d790386d
pkgrel=1
pkgdesc="a fork of the ZynAddSubFX software systhesizer"
arch=('x86_64')
url="https://yoshimi.github.io/"
license=('GPL')
depends=('alsa-lib' 'jack' 'fltk' 'fftw' 'mxml' 'cairo')
makedepends=('cmake' 'lv2' 'mesa' 'git')
provides=('yoshimi')
conflicts=('yoshimi')
source=("git+https://github.com/Yoshimi/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname/src"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
    cd "$_pkgname/src" 
    cmake -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_INSTALL_DATAROOTDIR='/usr/share' \
        -DCMAKE_INSTALL_LIBDIR='/usr/lib' .
    make
}

package() {
    cd "$_pkgname/src" 
    make DESTDIR="$pkgdir" install
    install -t "${pkgdir}/usr/share/doc/${_pkgname}/" \
        -vDm 644 ../{Changelog,Dependencies,README.txt,Yoshimi_Helpers}
}

