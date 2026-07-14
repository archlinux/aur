pkgname=adw-network-git
_pkgname=adw-network
pkgver=1.0.2.r2.g6b2467a
pkgrel=1
pkgdesc="Modern GTK4/Libadwaita network manager"
arch=('x86_64')
url="https://github.com/PlayRood32/adw-network"
license=('GPL-3.0-or-later')

depends=(
    'gtk4'
    'libadwaita'
    'networkmanager'
    'gdk-pixbuf2'
    'openssl'
)

makedepends=(
    'git'
    'cargo'
)

makedepends=(
    'git'
    'cargo'
)

provides=('adw-network' 'adwaita-network')
conflicts=('adw-network' 'adwaita-network')

source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --tags --long --always | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgname}"
    cargo build --release --locked
}

package() {
    cd "${srcdir}/${_pkgname}"

    install -Dm755 "${srcdir}/${_pkgname}/target/release/adwaita-network" \
        "${pkgdir}/usr/bin/adwaita-network"

    ln -sf adwaita-network "${pkgdir}/usr/bin/adw-network"

    install -Dm644 "${srcdir}/${_pkgname}/data/com.github.adw-network.desktop" \
        "${pkgdir}/usr/share/applications/com.github.adw-network.desktop"

    install -Dm644 "${srcdir}/${_pkgname}/data/icons/hicolor/scalable/apps/icon.png" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/icon.png"

    install -Dm644 "${srcdir}/${_pkgname}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}