# Maintainer: Branislav Matula <braniik69 at proton dot me>
# Contributor: <Kubenka's name> <brutovskyjakub.web at gmail dot com>

pkgname=astrojumps-git
pkgver=r19.94760aa
pkgrel=1
pkgdesc="A keyboard-driven space platformer built with C and raylib"
arch=('x86_64')
url="https://github.com/braniik/astrojumps"
license=('MIT')
depends=('raylib')
makedepends=('git')
provides=('astrojumps')
conflicts=('astrojumps')
source=("${pkgname}::git+https://github.com/braniik/astrojumps.git"
        "astrojumps.sh"
        "astrojumps.desktop")
sha256sums=('SKIP'
            'bc7fbc3ea19f92bd5cd172dd46353802fab11716597583177efccc9409090fd3'
            '603cf1f274b12f1a6cf476a7396a630bbce35c74d1a8f393e5b8e2539a8efc22')

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${pkgname}"
    make
}

package() {
    cd "${pkgname}"
    install -Dm755 astrojumps "${pkgdir}/usr/lib/astrojumps/astrojumps"
    install -Dm755 "${srcdir}/astrojumps.sh" "${pkgdir}/usr/bin/astrojumps"
    install -dm755 "${pkgdir}/usr/share/astrojumps"
    cp -r assets "${pkgdir}/usr/share/astrojumps/assets"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/astrojumps.desktop" \
        "${pkgdir}/usr/share/applications/astrojumps.desktop"
    install -Dm644 assets/icon.png \
        "${pkgdir}/usr/share/pixmaps/astrojumps.png"
}
