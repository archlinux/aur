# Maintainer: Ryan Owens <RyanOwens[at]linux[dot]com>

_pkgname=green-arc-theme
pkgname=green-arc-gtk-theme-git
pkgver=56.2758997
pkgrel=1
pkgdesc="Green Arc is a flat theme with transparent elements for GTK 3, GTK 2 and Gnome-Shell. It supports GTK 3 and GTK 2 based desktop environments like Gnome, Unity, Budgie, Pantheon, etc. Based on regular Arc Theme"
arch=('any')
url="https://github.com/ryanvade/Arc-theme"
license=('GPL3')
depends=('gnome-themes-standard' 'gtk-engine-murrine')
makedepends=('git')
conflicts=('arc-theme-git' "${_pkgname}")
provides=("${_pkgname}" 'arc-theme-git')
replaces=("${_pkgname}")
options=(!strip)
source=(${pkgname}::"git+https://github.com/ryanvade/Arc-theme.git")
sha256sums=('SKIP')


pkgver() {
    cd ${srcdir}/${pkgname}
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}


build(){
    cd $srcdir/$pkgname
    ./autogen.sh --prefix=/usr --with-gnome=3.16 --disable-unity --disable-xfwm

}
package() {
    cd $srcdir/$pkgname
    make DESTDIR="${pkgdir}" install
}

