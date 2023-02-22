# Maintainer: Ben Friesen <bfriesenwork@gmail.com>

_pkgname=xtext
pkgname=${_pkgname}-git
pkgver=20210105.7aa1c14
pkgrel=1
pkgdesc="Display Text w/ X11"
arch=('any')
url="www.github.com/resloved/xtext"
license=('GPL3')
depends=('pango' 'cairo' 'xorg-server')
makedepends=('git')
source=("git+https://github.com/resloved/${_pkgname}.git")
md5sums=(SKIP)

provides() {
        ${_pkgname}
}

conflicts() {
        "${_pkgname}"
}

pkgver() {
        cd "${srcdir}/${_pkgname}"
        git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
        cd "${srcdir}/${_pkgname}"
        make
}

package() {
        cd "${srcdir}/${_pkgname}"
        make PREFIX=/usr DESTDIR="${pkgdir}" install
        install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
        install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}
