# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=proton-authenticator-bin
_name=${pkgname%-bin}
pkgver=1.1.2
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
sha512sums=('dd4a11cb9902d02feb2e04a7c9b8192796066c3908ffb967f96db6cabbe088e1b7192dd82734ae03fb89578e994a22dd79b00410636f6bb65fa5807187bea953')
b2sums=('bd16d3ff11ed5c81d162e8b86b37769382913478a89ba3c45b4d0f8f6e9659acd530ea4ded5158a3c9d7633325e8440f7f7f95f4314ab126538791031a2d63c7')

package() {
    bsdtar -xvf data.tar.gz -C "$pkgdir/"

    # Fix display issue on Wayland+Nvidia and X11
    sed -i 's/Exec=proton-authenticator/Exec=env WEBKIT_DISABLE_DMABUF_RENDERER=1 proton-authenticator/' \
        "$pkgdir/usr/share/applications/Proton Authenticator.desktop"
}
