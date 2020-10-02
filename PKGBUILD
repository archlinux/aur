# Maintainer: Hilton Medeiros <medeiros.hilton@gmail.com>
_pkgname=Pixelorama
pkgname=pixelorama-bin
pkgver=0.8
pkgrel=1
pkgdesc="A free & open-source 2D sprite editor, made with the Godot Engine - precompiled binary"
arch=('i686' 'x86_64')
url="https://orama-interactive.itch.io/pixelorama"
license=('MIT')
depends=('libpulse' 'alsa-lib' 'libxrandr' 'libglvnd' 'libxcursor' 'libxinerama' 'hicolor-icon-theme')
provides=('pixelorama')
conflicts=('pixelorama' 'pixelorama-git')
source=("pixelorama.png" "com.orama_interactive.Pixelorama.appdata.xml" "com.orama_interactive.Pixelorama.desktop" "LICENSE")
source_i686=("https://github.com/Orama-Interactive/$_pkgname/releases/download/v$pkgver/$_pkgname.Linux-32bit.tar.gz")
source_x86_64=("https://github.com/Orama-Interactive/$_pkgname/releases/download/v$pkgver/$_pkgname.Linux-64bit.tar.gz")
sha256sums=('d92715606fb34e1863ecccd929675b742988ae55118146e2d9aee41c650b0933'
            'bb07bee454c7bc6225f10574c7ff147fd1dc2c0f8ba903d7d8c0f2fa5caa02f0'
            '5d9b6e1a44b07bfcfbf4fb3575d30df457571335c0c200f4130af51884f34b99'
            '45efa21eefa4ff8c09842be56bce57d2cba6260c223b1a8c46d5f6ffc34958d7')
sha256sums_i686=('e5ce456dc27588acc93c6dab79c6b186de7cdf329e9377d58b6950f32084620f')
sha256sums_x86_64=('17a815cfeac3aadc9f6ffdd31de530f6c723b7deeb65df1a5878cbedfa4af97a')

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
#  chmod +x ${pkgdir}/opt/${pkgname}/{*.so,${_pkgname}.${_pkgarch}}

  ln -s /opt/${pkgname}/${_pkgname}.${_pkgarch} "$pkgdir/usr/bin/pixelorama"
}
