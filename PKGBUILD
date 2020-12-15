# Maintainer: Hilton Medeiros <medeiros.hilton@gmail.com>
_pkgname=Pixelorama
pkgname=pixelorama-bin
pkgver=0.8.2
pkgrel=1
pkgdesc="A free & open-source 2D sprite editor, made with the Godot Engine"
arch=('i686' 'x86_64')
url="https://orama-interactive.itch.io/pixelorama"
license=('MIT')
depends=('libpulse' 'alsa-lib' 'libxi' 'libxrandr' 'libglvnd' 'libxcursor' 'libxinerama' 'hicolor-icon-theme')
provides=('pixelorama')
conflicts=('pixelorama' 'pixelorama-git')
source=("pixelorama.png" "com.orama_interactive.Pixelorama.appdata.xml" "com.orama_interactive.Pixelorama.desktop" "LICENSE")
source_i686=("$_pkgname-$pkgver-32bit.tar.gz::https://github.com/Orama-Interactive/$_pkgname/releases/download/v$pkgver/$_pkgname.Linux-32bit.tar.gz")
source_x86_64=("$_pkgname-$pkgver-64bit.tar.gz::https://github.com/Orama-Interactive/$_pkgname/releases/download/v$pkgver/$_pkgname.Linux-64bit.tar.gz")
sha256sums=('d92715606fb34e1863ecccd929675b742988ae55118146e2d9aee41c650b0933'
            '971c3d5c7a9258419f14dae0b81c38e13b1dcabfbf1e578baaed86fde1c28fbe'
            '5d9b6e1a44b07bfcfbf4fb3575d30df457571335c0c200f4130af51884f34b99'
            '45efa21eefa4ff8c09842be56bce57d2cba6260c223b1a8c46d5f6ffc34958d7')
sha256sums_i686=('0884e2d0f4c00091c46d89ac4919fb30ca735b14b21889cde1494c66f85d4cdd')
sha256sums_x86_64=('aed8bfc5ea68f144a2ee2673d5a3be6088979471e98cc84a6dd543de86b8e7c0')

package() {
  install -d "$pkgdir/opt/$pkgname"
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/metainfo"
  install -d "$pkgdir/usr/share/applications"
  install -d "$pkgdir/usr/share/icons/hicolor/256x256/apps"

  test "${CARCH}" == 'x86_64' && _pkgarch='64' || _pkgarch='32'
  cp -Trf "$srcdir/linux-${_pkgarch}bit" "$pkgdir/opt/$pkgname"
  install -Dm644 "$srcdir/com.orama_interactive.Pixelorama.desktop" "$pkgdir/usr/share/applications"
  install -Dm644 "$srcdir/com.orama_interactive.Pixelorama.appdata.xml" "$pkgdir/usr/share/metainfo"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/pixelorama.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps"

  test "${CARCH}" == 'x86_64' && _pkgarch='x86_64' || _pkgarch='x86'
  ln -s /opt/${pkgname}/${_pkgname}.${_pkgarch} "$pkgdir/usr/bin/pixelorama"
}
