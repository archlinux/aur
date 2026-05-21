# Maintainer: psi4j <116757358+psi4j@users.noreply.github.com>

pkgname=sunsetr
pkgver=0.12.2
pkgrel=1
pkgdesc="Automatic blue light filter for Hyprland, Niri, and everything Wayland"
arch=('x86_64')
url="https://github.com/psi4j/sunsetr"
license=('MIT')
depends=('wayland')
makedepends=('rust' 'cargo')
provides=('sunsetr')
conflicts=('sunsetr-bin' 'sunsetr-git')
replaces=('sunsetr-git-debug')
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('75f9055b03735a5c8b3b899429d6463266331d5d1814832545014e86935b2872')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    export SUNSETR_VERSION="$pkgver"
    cargo build --release --locked
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm755 "target/release/${pkgname}" \
                    "${pkgdir}/usr/bin/${pkgname}"

    install -Dm644 "LICENSE" \
                    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "${pkgname}.service" \
                    "${pkgdir}/usr/lib/systemd/user/${pkgname}.service"

    install -Dm644 "README.md" \
                    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim:set ts=4 sw=4 et:
