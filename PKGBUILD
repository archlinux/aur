# $Id$
# Maintainer: Fabien Devaux <fdev31 at gmail dot com>
pkgname=python2-pyg-git
pkgver=20111102
pkgrel=1
pkgdesc="Pyg package installer"
arch=('any')
url="http://bitbucket.org/rubik/pyg/"
license=('MIT')
depends=('python2' 'python2-distribute' 'python2-pkgtools' 'python2-argh')
makedepends=('git')
provides=('pyg')
conflicts=('python2-pyg')

_gitroot="git://github.com/rubik/pyg.git"
_gitname="pyg"


build() {
    cd $srcdir

    msg "Connecting to GIT server..."
    if [[ -d ${_gitname} ]]; then
        (cd ${_gitname} && git pull origin)
    else
        git clone --depth=1 ${_gitroot} ${_gitname}
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting make..."

    rm -rf ${_gitname}-build
    cp -r ${_gitname} ${_gitname}-build

    cd ${srcdir}/${_gitname}-build

    python2 setup.py build || exit 1
    python2 setup.py install --root="${pkgdir}" --optimize=1

    rm -rf ${_gitname}-build
}

