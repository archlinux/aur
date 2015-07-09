# Maintainer: Bastien Dejean <nihilhill@gmail.com>

_pkgname=bspwm
pkgname=${_pkgname}-git
pkgver=1009
pkgrel=1
pkgdesc='A tiling window manager based on binary space partitioning'
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/baskerville/${_pkgname}"
license=('custom:BSD')
depends=('libxcb' 'xcb-util' 'xcb-util-wm')
makedepends=('git')
optdepends=('sxhkd-git: to define keyboard and pointer bindings' 'bar-aint-recursive: for the example panel' 'xtitle-git: for the example panel' 'sutils-git: for the example panel' 'terminus-font: for the example panel')
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
