# Maintainer: Dmitry Kharitonov <arch[at]nano-model[dot]com>
# Contributor: Kyle Bloss <kylebloss[at]pelpix[dot]info>
# Contributor: Panagiotis Papadopoulos pano_90 AT gmx DOT net

pkgname=libbs2b-git
_gitname=libbs2b
pkgver=r75.5ca2d59
pkgrel=2
pkgdesc="Bauer stereophonic-to-binaural DSP effect library (GIT version)"
arch=('i686' 'x86_64')
url=https://github.com/alexmarsev/libbs2b
license=('custom')
depends=('libsndfile' 'libsndfile.so')
makedepends=('git')
provides=('libbs2b' 'libbs2b.so')
conflicts=('libbs2b')
source=('git+https://github.com/alexmarsev/libbs2b.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_gitname/"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_gitname/"
    ./autogen.sh
    ./configure --prefix=/usr
    make || return 1
}

package() {
    cd "$srcdir/$_gitname/"
    make DESTDIR=$pkgdir install  || return 1
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
