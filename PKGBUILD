# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=proton-authenticator-bin
_name=${pkgname%-bin}
pkgver=1.1.1
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
sha512sums=('eb12926a1387f07915a3f9477f4f30aeeca68f8c2fabde62426504014bfb9eb60dd72d39bf2eae21c2cc644e9cf9608d176b27cee4e5c69080eb416ad64853f1')
b2sums=('57123200411cf3254db3992b4ce9bdf880c5e752e0cc57db1324eb4e18f3bd57721d434103856f6f196f168066fa411ba6a1a738b17cafa43ec87988b872febb')

package() {
    bsdtar -xvf data.tar.gz -C "$pkgdir/"

    # Fix display issue on Wayland+Nvidia and X11
    sed -i 's/Exec=proton-authenticator/Exec=env WEBKIT_DISABLE_DMABUF_RENDERER=1 proton-authenticator/' \
        "$pkgdir/usr/share/applications/Proton Authenticator.desktop"
}
