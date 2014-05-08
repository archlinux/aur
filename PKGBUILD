# Maintainer: Bastien Dejean <nihilhill@gmail.com>

_pkgname=bspwm
pkgname=${_pkgname}-git
pkgver=917
pkgrel=1
pkgdesc='A tiling window manager based on binary space partitioning'
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/baskerville/${_pkgname}"
license=('custom:BSD')
depends=('libxcb' 'xcb-util' 'xcb-util-wm')
makedepends=('git')
optdepends=('sxhkd-git: to define keyboard and pointer bindings' 'xtitle-git: for the example panels' 'sutils-git: for the example panels' 'bar-aint-recursive: for the example bar panel' 'dzen2: for the example dzen2 panel' 'txtw-git: for the example dzen2 panel'  'sres-git: for the example dzen2 panel' 'ttf-dejavu: for the example dzen2 panel' 'xwinfo-git: for the example rules' 'lua: for the example rules' 'lua-posix: for the example rules')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git://github.com/baskerville/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git rev-list --count HEAD
}

build() {
    cd "$srcdir/$_pkgname"
    make PREFIX=/usr
}

package() {
    cd "$srcdir/$_pkgname"
    make PREFIX=/usr DESTDIR="$pkgdir" install
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
