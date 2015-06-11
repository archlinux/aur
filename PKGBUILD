# Maintainer: Benjamin Robin <benjarobin>

pkgname=gtkterm-git
_gitname=gtkterm
pkgver=109.c62d7ce
pkgrel=1
pkgdesc="A gtk+ based serial port communication program"
arch=('i686' 'x86_64')
url="https://fedorahosted.org/gtkterm/"
license=('GPL')
depends=('gtk3' 'vte3' 'systemd')
makedepends=('git' 'intltool' 'gnome-common')
provides=('gtkterm')
conflicts=('gtkterm')
source=('gtkterm::git+http://git.fedorahosted.org/git/gtkterm.git')
md5sums=('SKIP')
install="${pkgname}.install"

pkgver()
{
    cd "${_gitname}"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare()
{
    cd "${_gitname}"
    rm -f aclocal.m4 configure Makefile.in depcomp
}

build()
{
    cd "${_gitname}"
    msg "Starting configure..."
    ./autogen.sh --prefix=/usr --mandir=/usr/share/man
    msg "Starting make..."
    make
}

package()
{
    cd "${_gitname}"
    make DESTDIR="${pkgdir}" install
}

