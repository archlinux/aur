# Maintainer: blazebsc <blakeisfruity@proton.me>
# Maintainer: ofatrii <pub@oftr.me>
pkgname=froststrap-bin
_tag='v2.0.5'
pkgver=${_tag#v}
pkgver=${pkgver//-/.}
pkgrel=1
pkgdesc="A fork of Fishstrap/Bloxstrap, focused on performance and customization"
arch=('x86_64')
url="https://github.com/Froststrap/Froststrap"
license=('AGPL-3.0-or-later' 'MIT' 'MPL-2.0')
options=('!strip')
depends=('fontconfig' 'hicolor-icon-theme' 'gcc-libs' 'dbus')
source=("https://github.com/Froststrap/Froststrap/releases/download/${_tag}/Froststrap-linux-x64.deb"
    "LICENSE-AGPL::https://raw.githubusercontent.com/Froststrap/Froststrap/refs/tags/${_tag}/LICENSES/AGPL-3.0-only"
    "LICENSE-MIT::https://raw.githubusercontent.com/Froststrap/Froststrap/refs/tags/${_tag}/LICENSES/MIT"
    "LICENSE-MPL::https://raw.githubusercontent.com/Froststrap/Froststrap/refs/tags/${_tag}/LICENSES/MPL-2.0")
sha256sums=('1944733c4d1ead89a1e7cd7ab05d0df91312d4e060146f8a7409c6dcc3ae7e35'
            '8486a10c4393cee1c25392769ddd3b2d6c242d6ec7928e1414efff7dfb2f07ef'
            '34559d013a5a46dcce5bcb5efb3b9489dcf5e77381da540b6baf0cde78583db2'
            '1f256ecad192880510e84ad60474eab7589218784b9a50bc7ceee34c2b91f1d5')

package() {
    # Extract .deb contents
    tar -xf data.tar.gz -C "$pkgdir"

    # Rename binary to lowercase
    mv "$pkgdir/usr/bin/Froststrap" "$pkgdir/usr/bin/froststrap"

    # Fix desktop entry to use lowercase command and install to proper location
    sed -i 's/^\(Exec\|TryExec\)=Froststrap/\1=froststrap/' "$pkgdir/usr/share/applications/Froststrap.desktop"
    mv "$pkgdir/usr/share/applications/Froststrap.desktop" "$pkgdir/usr/share/applications/froststrap.desktop"

    # Install licenses
    install -Dm644 LICENSE-AGPL "$pkgdir/usr/share/licenses/$pkgname/AGPL-3.0"
    install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/MIT"
    install -Dm644 LICENSE-MPL "$pkgdir/usr/share/licenses/$pkgname/MPL-2.0"
}
