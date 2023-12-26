# Maintainer: zzy-ac <m@m-l.cc>

pkgname=varicad
_pkgname=VariCAD
pkgver=2024.1.01
pkgrel=2
url="https://www.varicad.com/"
pkgdesc="VariCAD is 3D/2D CAD for mechanical engineering."
arch=('x86_64')
license=(custom)
makedepends=()
depends=(libx11 libxcomposite libxdamage libxext libxfixes libxrender mime-types gtk2 hicolor-icon-theme)
provides=(varicad)
source=("${url}/userdata/files/release/en/${_pkgname}-${pkgver}_en-1.${arch}.rpm")
sha256sums=('321b33ae9f67d937f95ff3a13183acc92f432c3718192288ab8796b1a574696c')

package() {
  # Contents of this function are inspired by the install script located at:
  # $srcdir/opt/${_pkgname}/desktop/installdesktop.sh


  # executable
  mkdir -p $pkgdir/opt/${_pkgname} $pkgdir/usr/bin
  cp -r $srcdir/opt/${_pkgname}/{bin,lib} $pkgdir/opt/${_pkgname}/
  cd $pkgdir/usr/bin && ln -s ../../opt/${_pkgname}/bin/${pkgname}

  # icons
  install -Dm644 \
    $srcdir/opt/${_pkgname}/desktop/${pkgname}"".xpm \
    $pkgdir/usr/share/pixmaps/${pkgname}"".xpm

  for icon_resolution in hicolor locolor ; do
    for icon_size in 512 256 192 128 96 72 64 48 42 36 32 24 22 16 ; do
      icon_dim="$icon_size"x"$icon_size"
      icon_dir=$icon_resolution/$icon_dim
      install -Dm644 \
        $srcdir/opt/${_pkgname}/desktop/${pkgname}""_"$icon_dim".png \
        $pkgdir/usr/share/icons/$icon_dir/apps/${pkgname}"".png
    done
  done

  # desktop files
  install -Dm644 \
    $srcdir/opt/${_pkgname}/desktop/${pkgname}"".desktop \
    $pkgdir/usr/share/applications/${pkgname}"".desktop
  install -Dm644 \
    $srcdir/opt/${_pkgname}/desktop/x-${pkgname}"".desktop \
    $pkgdir/usr/share/mimelnk/application/x-${pkgname}"".desktop

  # documentation
  for install_file in $(ls $srcdir/usr/share/doc/packages/${_pkgname}) ;
  do
    install -Dm644 \
      $srcdir/usr/share/doc/packages/${_pkgname}/$install_file \
      $pkgdir/usr/share/doc/$pkgname/$install_file
  done
}


