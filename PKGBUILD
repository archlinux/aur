# Maintainer: Hilton Medeiros <medeiros.hilton@gmail.com>
_pkgname=Pixelorama
pkgname=pixelorama-bin
pkgver=0.7
pkgrel=2
pkgdesc="A free & open-source 2D sprite editor, made with the Godot Engine - precompiled binary"
arch=('i686' 'x86_64')
url="https://www.orama-interactive.com/pixelorama"
license=('MIT')
depends=('libpulse' 'alsa-lib' 'libxrandr' 'libglvnd' 'libxcursor' 'libxinerama' 'hicolor-icon-theme')
provides=('pixelorama')
conflicts=('pixelorama' 'pixelorama-git')
source=("pixelorama.png" "com.orama_interactive.Pixelorama.appdata.xml" "com.orama_interactive.Pixelorama.desktop" "LICENSE")
source_i686=("https://github.com/Orama-Interactive/$_pkgname/releases/download/v$pkgver/$_pkgname.v$pkgver.Linux.32-bit.zip")
source_x86_64=("https://github.com/Orama-Interactive/$_pkgname/releases/download/v$pkgver/$_pkgname.v$pkgver.Linux.64-bit.zip")
sha256sums=('d92715606fb34e1863ecccd929675b742988ae55118146e2d9aee41c650b0933'
            '22098341228acc5940c72a741c2e04804d1373f7f89c282526cfa66adddd94e0'
            '5d9b6e1a44b07bfcfbf4fb3575d30df457571335c0c200f4130af51884f34b99'
            '71f1828c30422206232e07fb511aab07e2295845719b2d0705a881f27fb43949')
sha256sums_i686=('3a7ed5ae486335d3c4d2427e98b87fd5ef7d725b8d8383f10ba99d094e8a5f18')
sha256sums_x86_64=('bd6bb866ac98ca3d0091bf78cc1617984732a3670a6c2b9859f2b12bf8648ea0')

package() {
  install -d "$pkgdir/opt/$pkgname"
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/metainfo"
  install -d "$pkgdir/usr/share/applications"
  install -d "$pkgdir/usr/share/icons/hicolor/256x256/apps"

  test "${CARCH}" == 'x86_64' && _pkgarch='64' || _pkgarch='32'
  cp -Trf "$srcdir/$_pkgname v$pkgver [Linux $_pkgarch-bit]" "$pkgdir/opt/$pkgname"
  install -Dm644 "$srcdir/com.orama_interactive.Pixelorama.desktop" "$pkgdir/usr/share/applications"
  install -Dm644 "$srcdir/com.orama_interactive.Pixelorama.appdata.xml" "$pkgdir/usr/share/metainfo"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/pixelorama.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps"

  test "${CARCH}" == 'x86_64' && _pkgarch='x86_64' || _pkgarch='x86'
  chmod +x ${pkgdir}/opt/${pkgname}/{*.so,${_pkgname}.${_pkgarch}}

  ln -s /opt/${pkgname}/${_pkgname}.${_pkgarch} "$pkgdir/usr/bin/pixelorama"
}
