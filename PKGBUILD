# Maintainer: modula t. <defaultxr at gmail dot com>
# Contributor: Alain Kalker <a.c.kalker at gmail dot com>

_pkgname=fluxus
pkgname=${_pkgname}-git
pkgver=v0.19
pkgrel=1
pkgdesc="A 3D game engine for livecoding worlds into existence"
arch=('i686' 'x86_64')
url="http://www.pawfal.org/fluxus/"
license=('GPL')
depends=('ode' 'fftw' 'liblo' 'glew' 'jack' 'freeglut' 'openal' 'racket')
makedepends=('git' 'python2-scons')
provides=('fluxus')
conflicts=('fluxus')
source=('fluxus::git+https://gitlab.com/nebogeo/fluxus.git')
md5sums=('SKIP')

# pkgver() {
#     cd "$srcdir/$_pkgname"
#     git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
# }

build() {
    cd "$srcdir/$_pkgname"

    scons2 Prefix=/usr RacketPrefix=/usr
    cd docs/helpmap
    ./makehelpmap.scm
}

package() {
    cd "$srcdir/$_pkgname"

    scons2 DESTDIR="$pkgdir/" Prefix=/usr RacketPrefix=/usr install

    # Install icon and desktop file
    install -d "$pkgdir"/usr/share/pixmaps
    install -m 644 modules/material/textures/fluxus-icon.png "$pkgdir"/usr/share/pixmaps
    install -d "$pkgdir"/usr/share/applications
    install -m 644 debian/fluxus.desktop "$pkgdir"/usr/share/applications
}
