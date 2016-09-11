# Maintainer: Brian Bidulock <bidulock@openss7.com>
# Contributor: Bastien Dejean <baskerville@lavabit.com>

_pkgname=sutils
pkgname=${_pkgname}-git
pkgver=35
pkgrel=1
pkgdesc='Small command-line utilities'
arch=('i686' 'x86_64')
url="https://github.com/baskerville/${_pkgname}"
license=('custom:Unlicense')
makedepends=('git')
optdepends=('alsa-lib: for volume utility')
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
