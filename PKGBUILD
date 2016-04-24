# Maintainer: Simon Perry <aur [at] sanxion [dot] net>
pkgname=cheesecutter
_pkgname=CheeseCutter
pkgver=2.8
pkgrel=1
pkgdesc="Tracker program for composing music for the C64 SID chip"
arch=('x86_64')
url="http://theyamo.kapsi.fi/ccutter/"
license=('GPL2')
depends=('gcc-libs' 'sdl' 'zlib')
makedepends=('acme-git' 'gdc')
provides=('cheesecutter')
conflicts=('cheesecutter-stereo')
source=("https://github.com/theyamo/${_pkgname}/archive/v${pkgver}-release.tar.gz")
sha256sums=('661cf94c41c5b9dfb17b147fe507750b7621355216ddcb6738596fff1f513932')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}-release"
    make release
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}-release"

    install -dm755 ${pkgdir}/usr/bin
    install -m755 ccutter ${pkgdir}/usr/bin
    install -m755 ct2util ${pkgdir}/usr/bin

    install -dm755 ${pkgdir}/usr/share/applications
    install -m644 arch/fd/ccutter.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop

    install -dm755 ${pkgdir}/usr/share/doc/${pkgname}
    install -m644 doc/README ${pkgdir}/usr/share/doc/${pkgname}

    install -dm755 ${pkgdir}/usr/share/licenses/${pkgname}
    install -m644 LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}

    install -dm755 ${pkgdir}/usr/share/pixmaps
    install -m644 icons/cc32.png ${pkgdir}/usr/share/pixmaps
    install -m644 icons/cc48.png ${pkgdir}/usr/share/pixmaps
    install -m644 icons/cc96.png ${pkgdir}/usr/share/pixmaps
    install -m644 icons/cc96.png ${pkgdir}/usr/share/pixmaps/ccutter-96.png

    install -dm755 ${pkgdir}/usr/share/${pkgname}/tunes
    install -m644 tunes/*.ct ${pkgdir}/usr/share/${pkgname}/tunes
}
