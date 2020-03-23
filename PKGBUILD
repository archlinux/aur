# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=clipmenu-git
_gitname=clipmenu
pkgver=5.6.0.r15.gbbf495c
pkgrel=1
pkgdesc='Clipboard management using dmenu'
url='http://github.com/cdown/clipmenu'
arch=('any')
license=('Public Domain')
depends=(dmenu xsel clipnotify)
provides=(clipmenu)
conflicts=(clipmenu)
makedepends=(git)

source=(git://github.com/cdown/clipmenu.git)
md5sums=('SKIP')

pkgver() {
    cd "$_gitname"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    install -D -m755 \
        "${srcdir?}/$_gitname/clipmenu" \
        "${pkgdir?}/usr/bin/clipmenu"
    install -D -m755 \
        "${srcdir?}/$_gitname/clipmenud" \
        "${pkgdir?}/usr/bin/clipmenud"
    install -D -m755 \
        "${srcdir?}/$_gitname/clipdel" \
        "${pkgdir?}/usr/bin/clipdel"
    install -D -m644 \
        "${srcdir?}/$_gitname/init/clipmenud.service" \
        "${pkgdir?}/usr/lib/systemd/user/clipmenud.service"
}
