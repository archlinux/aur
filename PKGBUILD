# $Id$
# Maintainer: Benjamin Robin <dev@benjarobin.fr>
# Contributor: Otto VonStein <otto>

pkgname=pencil2d-git
_gitname=pencil2d
pkgver=2517.3cc8eba2
pkgrel=1
pkgdesc="Animation/drawing software, that lets you create traditional hand-drawn animation using both bitmap and vector graphics"
arch=('i686' 'x86_64')
url="http://www.pencil2d.org/"
license=('GPL')
depends=('ming' 'ffmpeg' 'qt5-svg' 'qt5-multimedia' 'qt5-xmlpatterns')
makedepends=('git' 'qt5-tools')
provides=('pencil2d')
conflicts=('pencil2d')
options=('!staticlibs')
install=pencil2d.install
source=('pencil2d::git+https://github.com/pencil2d/pencil.git')
md5sums=('SKIP')

pkgver()
{
    cd "${_gitname}"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build()
{
    cd "${_gitname}"
    msg "Starting qmake..."
    qmake PREFIX=/usr
    msg "Starting make..."
    make
}

package()
{
    cd "${_gitname}"
    make install INSTALL_ROOT="${pkgdir}"
}

