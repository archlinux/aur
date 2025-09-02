# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=proton-authenticator-bin
_name=${pkgname%-bin}
pkgver=1.1.0
pkgrel=1
pkgdesc='An open source and end-to-end encrypted 2FA app. Securely sync and backup your 2FA codes easily.'
arch=('x86_64')
url='https://proton.me/authenticator'
license=('GPL-3.0-or-later')
depends=(
    'cairo'
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
sha512sums=('a4a92c5f6daa4ae0d841e2519e2b0c5b19cc904ca2789ec7433a59e4035c66c149a79393ed7cbd33350102411bdec46d1c9a59c8153295af29ae1184a8a2a70f')
b2sums=('036f1c81423cded12232c244eb68a9203a84741d6ddf02768cfa49c6b5f77769738362935552504688eb1e9c90e5689a2cdfc0a6ea1bbe9f1bb6d350a6d6392d')

package() {
    bsdtar -xvf data.tar.gz -C "$pkgdir/"

    # Fix display issue on Wayland+Nvidia and X11
    sed -i 's/Exec=proton-authenticator/Exec=env WEBKIT_DISABLE_DMABUF_RENDERER=1 proton-authenticator/' \
        "$pkgdir/usr/share/applications/Proton Authenticator.desktop"
}
