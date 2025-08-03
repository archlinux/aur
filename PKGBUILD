# Maintainer: AlphaLynx <AlphaLynx at protonmail dot com>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>

pkgname=proton-mail-bin
_name=${pkgname%-bin}
pkgver=1.8.1
pkgrel=3
pkgdesc='Proton official desktop application for Proton Mail and Proton Calendar'
arch=('x86_64')
url='https://proton.me'
license=('GPL-3.0-or-later')
depends=(
    'alsa-lib'
    'at-spi2-core'
    'cairo'
    'dbus'
    'expat'
    'gcc-libs'
    'glib2'
    'glibc'
    'gtk3'
    'gvfs'
    'libcups'
    'libdrm'
    'libnotify'
    'libx11'
    'libxcb'
    'libxcomposite'
    'libxdamage'
    'libxext'
    'libxfixes'
    'libxkbcommon'
    'libxrandr'
    'mesa'
    'nspr'
    'nss'
    'pango'
    'xdg-utils'
)
makedepends=('libarchive')
optdepends=(
    'kde-cli-tools: file deletion support (kioclient5)'
    'libgnome-keyring'
    'lsb-release'
    'trash-cli: file deletion support (trash-put)'
)
provides=("$_name")
conflicts=("$_name")
source=("ProtonMail-desktop-beta-$pkgver.deb::$url/download/mail/linux/$pkgver/ProtonMail-desktop-beta.deb")
sha256sums=('43397439a3ced8e02029beed3167e44b20f2c6f15d88e9cbf42588e73da774c3')

package() {
    bsdtar -xvf data.tar.xz -C "$pkgdir/"

    # Move main files to proper directory
    install -d "$pkgdir/opt/"
    mv "$pkgdir"/usr/lib/* "$pkgdir/opt"
    rm -rf "$pkgdir/usr/lib"

    # Fix permissions on misc files
    chmod go-w "$pkgdir"/opt/$_name/resources/*

    # Replace binary symlink
    ln -sf /opt/$_name/Proton\ Mail\ Beta "$pkgdir/usr/bin/$_name"

    # Remove lintian folder
    rm -rf "$pkgdir/usr/share/lintian"
}
