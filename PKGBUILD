# Maintainer: Hilton Medeiros <medeiros.hilton@gmail.com>
pkgname=material-maker-bin
_pkgname=material_maker
pkgver=0.94
_pkgver=${pkgver//./_}
pkgrel=1
pkgdesc="A tool that can be used to create textures procedurally and paint 3D models"
arch=('x86_64')
url="https://rodzilla.itch.io/material-maker"
license=('MIT')
depends=('libpulse' 'alsa-lib' 'libxi' 'libxrandr' 'libglvnd' 'libxcursor' 'libxinerama' 'hicolor-icon-theme')
options=(!strip)
provides=('material-maker')
conflicts=('material-maker' 'material-maker-git')
source=(https://github.com/RodZill4/material-maker/releases/download/${pkgver}/${_pkgname}_${_pkgver}_linux.tar.gz
        io.github.RodZill4.Material-Maker.appdata.xml
        io.github.RodZill4.Material-Maker.desktop
        material-maker.png
        LICENSE)
sha256sums=('a2999f6e61e8c871337ad2ef899f6a431bd4d84cd36209b9c148bca3cbeac83b'
            '2a2eafab867f877a62b600257a7a640f115f356b14fc102d051d742620d1c7f8'
            'd8c96863144183d9f256229232c0cfe18b10518abdb2bba3477781a8d96f0133'
            'b6217901109513d5856369b1d9fd8a1981b584ab8d3091fa9c37691782495222'
            'SKIP')

package() {
  install -d "$pkgdir/opt/$pkgname"
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/metainfo"
  install -d "$pkgdir/usr/share/applications"
  install -d "$pkgdir/usr/share/icons/hicolor/64x64/apps"

  cp -Trf "$srcdir/${_pkgname}_${_pkgver}_linux" "$pkgdir/opt/$pkgname"
  install -Dm644 "$srcdir/io.github.RodZill4.Material-Maker.desktop" "$pkgdir/usr/share/applications"
  install -Dm644 "$srcdir/io.github.RodZill4.Material-Maker.appdata.xml" "$pkgdir/usr/share/metainfo"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/material-maker.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps"

  ln -s /opt/${pkgname}/${_pkgname}.${CARCH} "$pkgdir/usr/bin/material-maker"
}
