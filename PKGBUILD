# Maintainer:  AppleBloom <rat.o.drat@gmail.com>

pkgname='gimp-plugin-resynthesizer-scm-git'
pkgver='r154.c44500b'
pkgrel='1'
pkgdesc='Suite of gimp plugins for texture synthesis (like heal-selection) - fork that works with GIMP 2 without Python 2 (using script-fu); git version.'
arch=('x86_64')
url='https://github.com/itr-tert/gimp-resynthesizer-scm'
license=('GPL-3.0-only')
depends=('gimp')
makedepends=('git' 'intltool')
provides=('gimp-plugin-resynthesizer-scm')
conflicts=('gimp-plugin-resynthesizer-scm' 'gimp-plugin-resynthesizer')
source=('git+https://github.com/itr-tert/gimp-resynthesizer-scm.git')
md5sums=('SKIP')

pkgver() {
    cd 'gimp-resynthesizer-scm'
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd 'gimp-resynthesizer-scm'
    sed -i 's/--enable-maintainer-mode//g' autogen.sh
}

build() {
    cd 'gimp-resynthesizer-scm'
    ./autogen.sh --disable-maintainer-mode --prefix=/usr
    make
}

package() {
    cd 'gimp-resynthesizer-scm'
    make DESTDIR="$pkgdir/" install
}
