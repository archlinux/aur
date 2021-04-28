# Maintainer: Hilton Medeiros <medeiros.hilton@gmail.com>
pkgname=material-maker-bin
_pkgname=material_maker
pkgver=0.95
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
sha256sums=('93fac6014bec60c98ca74d26e75c73c3780551118b3e9d99ef6e093073f4e70c'
            '7d369315be482f5abdd98ffb6e9f017b49fc37ba0f5f615811a053fb865376a3'
            'd8c96863144183d9f256229232c0cfe18b10518abdb2bba3477781a8d96f0133'
            '72ee1a0fc59b798b8849eb9bd0cb7b67fd9ee3ff41645f90c2ca98168f3619ef'
            'd7d038704c498e2e9fb93ad11235e3fb2e801f6b47cf081b8a3eff57f9af78e7')

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
