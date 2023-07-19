# Maintainer: Hilton Medeiros <medeiros.hilton@gmail.com>
_pkgname=Pixelorama
pkgname=pixelorama-bin
pkgver=0.11
pkgrel=1
pkgdesc="A free & open-source 2D sprite editor, made with the Godot Engine"
arch=('i686' 'x86_64')
url="https://orama-interactive.itch.io/pixelorama"
license=('MIT')
depends=('libxi' 'libxrandr' 'libglvnd' 'libxcursor' 'libxinerama' 'hicolor-icon-theme')
provides=('pixelorama')
conflicts=('pixelorama' 'pixelorama-git')
source=("pixelorama.png" "com.orama_interactive.Pixelorama.appdata.xml" "com.orama_interactive.Pixelorama.desktop" "LICENSE")
source_i686=("$_pkgname-$pkgver-32bit.tar.gz::https://github.com/Orama-Interactive/$_pkgname/releases/download/v$pkgver/$_pkgname.Linux-32bit.tar.gz")
source_x86_64=("$_pkgname-$pkgver-64bit.tar.gz::https://github.com/Orama-Interactive/$_pkgname/releases/download/v$pkgver/$_pkgname.Linux-64bit.tar.gz")
sha256sums=('dd7cba7e5f41ca001aaa297a27c816308f430cbbacaf717da94ebab2b9803b54'
            'dbb842647b2b99a135ddb3d451c2d8c6bef1aded4724af3c1eceb794527c9907'
            'f55e641204bd30f9343bb3e42ab180522ae2ffdcd60b1b65f84e18dacc6a99f1'
            '07ddf85025568856f9b92fb7193589dd055c749c563aa9b2d4e943eb53ef61f9')
sha256sums_i686=('861c2a77e336db76c1e15a1ff0d9d5c01025ad5f88af04e20016a6d26faf5556')
sha256sums_x86_64=('de314db0a449c7afa190d130e49b8719ea0f249f79bf5e3787adc7e13913876f')

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
