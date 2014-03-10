# Maintainer: Cedric Girard <girard.cedric@gmail.com>
# Contributor: Jason Axelson <jason.axelsonATgmail.com>
# Contributor: Sean Escriva <sean.escrivaATgmail.com>
# Contributor: William Ting <william.h.tingATgmail.com>

pkgname=autojump-git
pkgver=release.v21.6.9.149.g72313db
pkgrel=1
pkgdesc="A faster way to navigate your filesystem from the command line"
arch=(any)
url="http://github.com/joelthelion/autojump"
license=('GPL3')
depends=('bash' 'python')
makedepends=('git')
conflicts=('autojump')
provides=('autojump')
replaces=()
backup=()
source=('git+https://github.com/joelthelion/autojump.git')
md5sums=('SKIP')
install='install'

_gitname="autojump"

pkgver() {
    cd ${_gitname}
    git describe --always | sed 's|-|.|g'
}

prepare() {
    cd ${_gitname}
    sed -i 's$#!/usr/bin/env python$#!/usr/bin/env python2$' bin/autojump bin/*.py
}

package() {
    cd ${_gitname}
    /usr/bin/env python2 ./install.py --prefix 'usr/' --destdir "${pkgdir}" --zshshare 'usr/share/zsh/site-functions'
}


# vim:set ts=4 sw=4 et:
