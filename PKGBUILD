# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>

pkgname=proton-mail-bin
_name=${pkgname%-bin}
pkgver=1.9.0
pkgrel=1
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
sha512sums=('b43abcf864e6296d112231cf262c8c4cac82f4b1c54cb5ba06ebb63bf032a150fd5d97d4343b9037a9694e86cb2d26d8ed1d7741668a0a3e7e123fa9cc847c75')
b2sums=('553982eb417359eeae9bf2cf6f4dbd02784cf0ad9108ed118bab5c48cfff91d2539179ab542f5f9425ce220205b80cf44969891dee4e89516002a443acf32e4a')

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
