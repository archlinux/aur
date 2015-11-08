# Maintainer: Viktor Semykin <thesame.ml@gmail.com>
pkgbase='deadbeef-decast-git'
pkgname=('deadbeef-decast-gtk2-git' 'deadbeef-decast-gtk3-git')
_pkgdesc='Podcast subscription plugin for DeaDBeeF audio player.'
url='https://bitbucket.org/thesame/decast'
pkgver=0.1
pkgrel=1
_commit='9ffd6d6dfb14'
arch=('i686' 'x86_64')
license=('ZLIB')
_depends=('deadbeef' 'libxml2' 'curl')
makedepends=('deadbeef' 'libxml2' 'curl' 'gtk2' 'gtk3')
source=("git+https://bitbucket.org/thesame/decast.git")
md5sums=('SKIP')

pkgver() {
  cd decast
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare () {
    cd "${srcdir}"
    cp -r decast decast-gtk2
    cp -r decast decast-gtk3
}

build () {
    
    export \
        GTKVER=2 \
        PREFIX=/usr \
        DESTDIR="${pkgdir}/usr/lib/deadbeef"
    cd "${srcdir}/decast-gtk2"
    make
    
    export \
        GTKVER=3 \
        PREFIX=/usr \
        DESTDIR="${pkgdir}/usr/lib/deadbeef"
    cd "${srcdir}/decast-gtk3"
    make
    
}

package_deadbeef-decast-gtk2-git () {
    pkgdesc="$_pkgdesc GTK2 Ver."
    provides=${pkgname%%-git}
    conflicts=${pkgname%%-git}
    depends=($_depends gtk2)
    export \
        GTKVER=2 \
        PREFIX=/usr \
        DESTDIR="${pkgdir}/usr/lib/deadbeef"
    cd "${srcdir}/decast-gtk2"
    make install
}

package_deadbeef-decast-gtk3-git () {
    pkgdesc="$_pkgdesc GTK3 Ver."
    provides=${pkgname%%-git}
    conflicts=${pkgname%%-git}
    depends=($_depends gtk3)
    export \
        GTKVER=3 \
        PREFIX=/usr \
        DESTDIR="${pkgdir}/usr/lib/deadbeef"
    cd "${srcdir}/decast-gtk3"
    make install
}
