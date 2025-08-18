# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
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
sha512sums=('31635456313c2fb4d41172eeaffe779484cb690fcd70cab56ded52064017bef227ea25ed98d9fc7f602200b97b04532b344c35081dfb3a847720f510101b8939')
b2sums=('490011373e001f00affa131a870a8cf246022df4be54b47bb2cb1aa4606b65d56f94bae2b67a16e1935d5ae3d6df51dd69bc4a3c3339e1977823f53e65844ebd')

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
