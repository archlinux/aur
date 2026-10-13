# Maintainer: Fangru Shao <matrixc7p@gmail.com>
pkgname=agy-switch-bin
_pkgname=agy-switch
pkgver=4.10.7
pkgrel=1
pkgdesc="AntiGravity Switch: manage Antigravity accounts, quotas and local usage on macOS, Windows and Linux"
arch=('x86_64')
url="https://github.com/anglee0323/agy-switch"
license=('CC-BY-NC-SA-4.0')
depends=(
    'glibc'
    'gcc-libs'
    'gtk3'
    'webkit2gtk-4.1'
    'libayatana-appindicator'
    'cairo'
    'gdk-pixbuf2'
    'glib2'
    'pango'
    'xdg-utils'
)
optdepends=(
    'gnome-keyring: for secure credential storage'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip' '!debug')
source=("https://github.com/anglee0323/agy-switch/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.deb"
        "https://raw.githubusercontent.com/anglee0323/agy-switch/v${pkgver}/LICENSE")
sha256sums=('bdb5a3a118d62abd687dafe74c7198ce5677c8534dcd1f4ff3b9c880b58e814d'
            '6f0afc78b16f446941c6201dcc0a53e1d19dcb96b9fc2ccb497b1bf029aa3512')

package() {
    # Extract data archive from deb package
    bsdtar -xf "data.tar.gz" -C "${pkgdir}/"

    # Fix desktop entry category
    sed -i 's|^Categories=.*|Categories=Utility;Development;|' "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
