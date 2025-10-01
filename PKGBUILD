# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=proton-authenticator-bin
_name=${pkgname%-bin}
pkgver=1.1.4
pkgrel=2
pkgdesc='2FA app from Proton to securely sync and backup 2FA codes'
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
sha512sums=('f442dbf6c798586316f0e49cdfec999787cee3a0e1b42d43a868405e4f1f33496eb9e20a15209ad31595b26ac795eb7808bc10c341658c89732727bef5ca55de')
b2sums=('8a74c7950ec4e9d3bb678266010b8c004b3fe49788ad93275bfe5c70cf353ca457ee3ec6e0ce5c8b54c03ab3bc6577c40f4ae6cf4c8c19947b34c48f34d5f6ec')

package() {
    bsdtar -xvf data.tar.gz -C "$pkgdir/"

    # Fix display issue on Wayland+Nvidia and X11
    sed -i 's/Exec=proton-authenticator/Exec=env WEBKIT_DISABLE_DMABUF_RENDERER=1 proton-authenticator/' \
        "$pkgdir/usr/share/applications/Proton Authenticator.desktop"
}
