# $Id$
# Maintainer: Fabien Devaux <fdev31 at gmail dot com>

_py=python2
_gitname="pydub"

pkgname=$_py-$_gitname-git
pkgver=20120123
pkgrel=1
pkgdesc="Manipulate audio with an simple and easy high level interface"
arch=('any')
url="http://pydub.com"
license=('MIT')
depends=($_py 'ffmpeg')
makedepends=($_py "$_py-distribute" 'git')
conflicts=("$_py-$_gitname")

_gitroot="git://github.com/jiaaro/$_gitname.git"

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

    $_py setup.py build || exit 1
    $_py setup.py install --root="${pkgdir}" --optimize=1

    rm -rf ${_gitname}-build
}

