# Maintainer: Hilton Medeiros <medeiros.hilton@gmail.com>
pkgname=material-maker-bin
_pkgname=material_maker
pkgver=0.93
_pkgver=${pkgver//./_}
pkgrel=1
pkgdesc="A tool based on Godot Engine that can be used to create textures procedurally"
arch=('x86_64')
url="https://rodzilla.itch.io/material-maker"
license=('MIT')
depends=('libpulse' 'alsa-lib' 'libxrandr' 'libglvnd' 'libxcursor' 'libxinerama' 'hicolor-icon-theme')
options=(!strip)
provides=('material-maker')
conflicts=('material-maker' 'material-maker-git')
source=(https://github.com/RodZill4/material-maker/releases/download/${pkgver}/${_pkgname}_${_pkgver}_linux.tar.gz
        io.github.RodZill4.Material-Maker.appdata.xml
        io.github.RodZill4.Material-Maker.desktop
        material-maker.png
        LICENSE)
sha256sums=('b85f2c2b577e899d741c50d1047bb3870fd4a784f3927112264eba737890b28f'
            '4a27286e448b35c2e7e840c267ac2402f53956ff9fcb5c5f8285797753c32e38'
            'd8c96863144183d9f256229232c0cfe18b10518abdb2bba3477781a8d96f0133'
            'b6217901109513d5856369b1d9fd8a1981b584ab8d3091fa9c37691782495222'
            'ddbacfaf9c588c476c73073e27f69d8137fe41cec7e9081ad0f6fefaa92541b3')

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
