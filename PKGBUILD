# Maintainer: nic96 <jeromyreimer at gmail dot com>

pkgname=filmic-blender-git
pkgver=20170218
blenderver=$(blender -v | grep Blender | grep -o '[0-9]\.[0-9][0-9]')
pkgrel=1
pkgdesc="Filmic View and Look Transformations for Blender"
arch=('any')
url="https://sobotka.github.io/filmic-blender/"
license=('GPL3')
depends=('blender')
provides=('filmic-blender')
source=("git+https://github.com/sobotka/filmic-blender.git"
       "filmic-blender.desktop")
md5sums=('SKIP' '68d8e7cbb520196b7715cb882f3cffac')

prepare() {
    cd $srcdir
    sed -i "s/blenderver/${blenderver}/" filmic-blender.desktop
}

package() {
  cd $srcdir

  install -d "$pkgdir/usr/share/blender/$blenderver/datafiles/filmic-blender"
  cp -r $srcdir/filmic-blender/* "$pkgdir/usr/share/blender/$blenderver/datafiles/filmic-blender"

  # desktop file
  install -Dm644 filmic-blender.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}
