# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=proton-authenticator-bin
_name=${pkgname%-bin}
pkgver=1.1.3
pkgrel=1
pkgdesc='An open source and end-to-end encrypted 2FA app. Securely sync and backup your 2FA codes easily.'
arch=('x86_64')
url='https://proton.me/authenticator'
license=('GPL-3.0-or-later')
depends=(
    'cairo'
    'dbus'
    'gcc-libs'
    'gdk-pixbuf2'
    'glib2'
    'glibc'
    'gtk3'
    'hicolor-icon-theme'
    'libsoup3'
    'pango'
    'webkit2gtk-4.1'
)
makedepends=('libarchive')
provides=("$_name")
conflicts=("$_name")
source=("https://proton.me/download/authenticator/linux/ProtonAuthenticator_${pkgver}_amd64.deb")
sha512sums=('b6bdf4ef499e5bfd2b5b4fd799992ec54154f366557683b22bf2a40519e47d73c45bd373a0eb332e6794321a8bd503131578933f44d28e5de4adeef917bbd18f')
b2sums=('04fb6280c51ccf673fefa95a0540fe824de2115a867f74299fc9a1e433eda0ae4fda23891e0275a421b2f11427d6db45bdc31075df2e043233ea8a3b3e841a37')

package() {
    bsdtar -xvf data.tar.gz -C "$pkgdir/"

    # Fix display issue on Wayland+Nvidia and X11
    sed -i 's/Exec=proton-authenticator/Exec=env WEBKIT_DISABLE_DMABUF_RENDERER=1 proton-authenticator/' \
        "$pkgdir/usr/share/applications/Proton Authenticator.desktop"
}
