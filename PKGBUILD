# Maintainer: pzl <alsoelp@gmail.com>
# Maintainer: Bastien Dejean <nihilhill@gmail.com>


_pkgname=sxhkd
pkgname=${_pkgname}-git
pkgver=187.fe241b0
pkgrel=1
pkgdesc='A simple X hotkey daemon'
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/baskerville/${_pkgname}"
license=('custom:BSD')
depends=('libxcb' 'xcb-util-keysyms')
makedepends=('git' 'xcb-util')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/baskerville/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    echo `git rev-list --count HEAD`.`git rev-parse --short HEAD`
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
