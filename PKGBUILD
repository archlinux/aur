# Maintainer: Petr Manek <pm+aur at petrmanek dot cz>

pkgname=varicad
_pkgname=varicad
pkgver=2024.1.01
pkgrel=1
pkgdesc="Free viewer, convertor & printing software working with 2D DWG, DXF, 3D STEP formats."
arch=('x86_64')
license=(custom)
makedepends=()
depends=(libx11 libxcomposite libxdamage libxext libxfixes libxrender mime-types gtk2 hicolor-icon-theme)
provides=(varicad)
source=("https://www.varicad.com/userdata/files/release/en/VariCAD-${pkgver}_en-1.x86_64.rpm")

url="https://www.varicad.com/"
sha256sums=('321b33ae9f67d937f95ff3a13183acc92f432c3718192288ab8796b1a574696c')

package() {
  # Contents of this function are inspired by the install script located at:
  # $srcdir/opt/VariCAD/desktop/installdesktop.sh


  # executable
  mkdir -p $pkgdir/opt/VariCAD $pkgdir/usr/bin
  cp -r $srcdir/opt/VariCAD/{bin,lib} $pkgdir/opt/VariCAD/
  cd $pkgdir/usr/bin && ln -s ../../opt/VariCAD/bin/varicad

  # icons
  install -Dm644 \
    $srcdir/opt/VariCAD/desktop/varicad"".xpm \
    $pkgdir/usr/share/pixmaps/varicad"".xpm

  for icon_resolution in hicolor locolor ; do
    for icon_size in 512 256 192 128 96 72 64 48 42 36 32 24 22 16 ; do
      icon_dim="$icon_size"x"$icon_size"
      icon_dir=$icon_resolution/$icon_dim
      install -Dm644 \
        $srcdir/opt/VariCAD/desktop/varicad""_"$icon_dim".png \
        $pkgdir/usr/share/icons/$icon_dir/apps/varicad"".png
    done
  done

  # desktop files
  install -Dm644 \
    $srcdir/opt/VariCAD/desktop/varicad"".desktop \
    $pkgdir/usr/share/applications/varicad"".desktop
  install -Dm644 \
    $srcdir/opt/VariCAD/desktop/x-varicad"".desktop \
    $pkgdir/usr/share/mimelnk/application/x-varicad"".desktop

  # documentation
  for install_file in $(ls $srcdir/usr/share/doc/packages/VariCAD) ;
  do
    install -Dm644 \
      $srcdir/usr/share/doc/packages/VariCAD/$install_file \
      $pkgdir/usr/share/doc/$pkgname/$install_file
  done
}


