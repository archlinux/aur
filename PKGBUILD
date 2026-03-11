# Maintainer: Petr Manek <pm+aur at petrmanek dot cz>

pkgname=varicad-view
_pkgver_year=2026
_pkgver_majmin=2.01
_pkgver_rel=1
pkgver=${_pkgver_year}.${_pkgver_majmin}
pkgrel=1
pkgdesc="Free viewer, convertor & printing software working with 2D DWG, DXF, 3D STEP formats."
arch=('x86_64')
license=(custom)
makedepends=()
depends=(libx11 libxcomposite libxdamage libxext libxfixes libxrender mime-types gtk2 hicolor-icon-theme)
provides=(varicad-view)
source=("https://www.varicad.com/userdata/files/release/VariCAD_View-${_pkgver_year}.${_pkgver_majmin}-${_pkgver_rel}.$CARCH.rpm")
url="https://www.varicad.com/"
sha256sums=('c408220944aa4c4247cdb4d15677eaee1a9e0980f53c4fab24e1f7a4b57f9ffe')

package() {
  # Contents of this function are inspired by the install script located at:
  # $srcdir/opt/VariCAD-View/desktop/installdesktop.sh

  addon=view

  # executable
  mkdir -p $pkgdir/opt/VariCAD-View $pkgdir/usr/bin
  cp -r $srcdir/opt/VariCAD-View/{bin,lib} $pkgdir/opt/VariCAD-View/
  cd $pkgdir/usr/bin && ln -s ../../opt/VariCAD-View/bin/varicad-view

  # icons
  install -Dm644 \
    $srcdir/opt/VariCAD-View/desktop/varicad"$addon".xpm \
    $pkgdir/usr/share/pixmaps/varicad"$addon".xpm

  for icon_resolution in hicolor locolor ; do
    for icon_size in 512 256 192 128 96 72 64 48 42 36 32 24 22 16 ; do
      icon_dim="$icon_size"x"$icon_size"
      icon_dir=$icon_resolution/$icon_dim
      install -Dm644 \
        $srcdir/opt/VariCAD-View/desktop/varicad"$addon"_"$icon_dim".png \
        $pkgdir/usr/share/icons/$icon_dir/apps/varicad"$addon".png
    done
  done

  # desktop files
  install -Dm644 \
    $srcdir/opt/VariCAD-View/desktop/varicad"$addon".desktop \
    $pkgdir/usr/share/applications/varicad"$addon".desktop
  install -Dm644 \
    $srcdir/opt/VariCAD-View/desktop/x-varicad"$addon".desktop \
    $pkgdir/usr/share/mimelnk/application/x-varicad"$addon".desktop

  # documentation
  for install_file in $(ls $srcdir/usr/share/doc/packages/VariCAD_View) ;
  do
    install -Dm644 \
      $srcdir/usr/share/doc/packages/VariCAD_View/$install_file \
      $pkgdir/usr/share/doc/$pkgname/$install_file
  done
}


