# Maintainer: Hilton Medeiros <medeiros.hilton@gmail.com>
_pkgname=Pixelorama
pkgname=pixelorama-bin
pkgver=1.1.8
pkgrel=1
pkgdesc="A free & open-source 2D sprite editor, made with the Godot Engine"
arch=('i686' 'x86_64')
url="https://pixelorama.org"
license=('MIT')
depends=('libxi' 'libxrandr' 'libglvnd' 'libxcursor' 'libxinerama' 'hicolor-icon-theme')
provides=('pixelorama')
conflicts=('pixelorama')
source=("pixelorama.png"
        "com.orama_interactive.Pixelorama.xml"
        "com.orama_interactive.Pixelorama.appdata.xml"
        "com.orama_interactive.Pixelorama.desktop"
        "LICENSE")
source_i686=("$_pkgname-$pkgver-32bit.tar.gz::https://github.com/Orama-Interactive/$_pkgname/releases/download/v$pkgver/$_pkgname-Linux-32bit.tar.gz")
source_x86_64=("$_pkgname-$pkgver-64bit.tar.gz::https://github.com/Orama-Interactive/$_pkgname/releases/download/v$pkgver/$_pkgname-Linux-64bit.tar.gz")
sha256sums=('184a59fbb665f1b9e8b2bc0d8e969903c1554cf9cbc729d68d02e846682e6419'
            '4fcf324e7c1eb8277bd9368047c0f9368ff1a32d3aba14d6b7d6459efcf7054f'
            '2829bfcc450bc362cd6186a403e631be088b79371a35443fd00750a73e31d90a'
            '357d058e56a4286dea412ed4694a9b95336405387a3fee3ad9f10019de9dc753'
            '07ddf85025568856f9b92fb7193589dd055c749c563aa9b2d4e943eb53ef61f9')
sha256sums_i686=('81c4db88e8f260ccf616219fbcb443c9cd0180174001fa0528b01366dc5d85fc')
sha256sums_x86_64=('6eabd0f74b734b1444656bc9a0fd0114540804225469ae80ecca320878387e3b')

package() {
  install -d "$pkgdir/opt/$pkgname"
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/metainfo"
  install -d "$pkgdir/usr/share/applications"
  install -d "$pkgdir/usr/share/mime/packages"
  install -d "$pkgdir/usr/share/icons/hicolor/256x256/apps"

  test "${CARCH}" == 'x86_64' && _pkgarch='64' || _pkgarch='32'
  cp -Trf "$srcdir/${_pkgname}-Linux-${_pkgarch}bit" "$pkgdir/opt/$pkgname"
  install -Dm644 "$srcdir/com.orama_interactive.Pixelorama.desktop" "$pkgdir/usr/share/applications"
  install -Dm644 "$srcdir/com.orama_interactive.Pixelorama.appdata.xml" "$pkgdir/usr/share/metainfo"
  install -Dm644 "$srcdir/com.orama_interactive.Pixelorama.xml" "$pkgdir/usr/share/mime/packages"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/pixelorama.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps"

  test "${CARCH}" == 'x86_64' && _pkgarch='x86_64' || _pkgarch='x86'
  ln -s /opt/${pkgname}/${_pkgname}.${_pkgarch} "$pkgdir/usr/bin/pixelorama"
}
