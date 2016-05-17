# Maintainer: Yuexuan Gu <lastavengers@outlook.com>

pkgname=ricin-git
_pkgname=Ricin
pkgver=0.680.89ad7e7
pkgrel=1
pkgdesc="A dead-simple but powerful Tox client."
url="https://ricin.im/"
arch=('i686' 'x86_64')
license=('GPL3')
makedepends=('git'
             'vala'
             'python'
             'intltool'
             )
depends=('gtk3'
         'toxcore'
         'glib2'
         'json-glib'
         'libsoup'
         'libnotify'
         )

source=("git+https://github.com/RicinApp/Ricin.git")
sha256sums=('SKIP')
provides=('ricin')
conflicts=('ricin')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    echo "0.$(git rev-list --count HEAD).$(git describe --always)"
}

build() {
    cd "${srcdir}/${_pkgname}"

    ./waf distclean
    ./waf configure --prefix=${pkgdir}/usr --bindir=${pkgdir}/usr/bin
    ./waf build
}

package() {
    cd "${srcdir}/${_pkgname}"
    ./waf install

    # cover ${pkgdir}/usr/bin/Ricin"
    rm "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm755 "build/${_pkgname}" "${pkgdir}/usr/bin/ricin"
}
