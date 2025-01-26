pkgname=improve-imgsli
pkgver=1.4.1
pkgrel=1
pkgdesc="Image comparison tool with magnifying glass feature"
arch=('any')
url="https://github.com/Loganavter/Improve-ImgSLI"
license=('MIT')
depends=('python' 'python-pillow' 'python-pyqt6' 'python-pyqt6-sip')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Loganavter/Improve-ImgSLI/archive/5684f2af7ba1e9a240c1015f73dc3740993b8188.zip")
sha256sums=('be3ccd1e67e92ed87bf776d763b1a6bed952757a85f8fd71cc36fbffd52fc987')

prepare() {
  # Create .desktop file
  cat > improve-imgsli.desktop << EOF
[Desktop Entry]
Name=Improve ImgSLI
Comment=Image comparison tool with magnifying glass feature
Exec=improve-imgsli
Icon=improve-imgsli
Terminal=false
Type=Application
Categories=Graphics;Photography;
Keywords=image;comparison;magnifier;
EOF
}

package() {
  cd "$srcdir/Improve-ImgSLI-5684f2af7ba1e9a240c1015f73dc3740993b8188"

  # Create necessary directories
  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/lib/$pkgname"
  install -dm755 "$pkgdir/usr/share/applications"
  install -dm755 "$pkgdir/usr/share/icons/hicolor/256x256/apps"

  # Install program files
  install -m755 Improve_ImgSLI.py "$pkgdir/usr/lib/$pkgname/"
  install -m644 clickable_label.py "$pkgdir/usr/lib/$pkgname/"
  install -m644 image_comparison_app.py "$pkgdir/usr/lib/$pkgname/"
  install -m644 image_processing.py "$pkgdir/usr/lib/$pkgname/"
  install -m644 flag_icons.py "$pkgdir/usr/lib/$pkgname/"
  install -m644 translations.py "$pkgdir/usr/lib/$pkgname/"

  # Install icon
  install -m644 33.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/improve-imgsli.png"

  # Install .desktop file
  install -m644 "$srcdir/improve-imgsli.desktop" "$pkgdir/usr/share/applications/"

  # Create launcher script
  echo '#!/bin/sh
exec python /usr/lib/improve-imgsli/Improve_ImgSLI.py "$@"' > "$pkgdir/usr/bin/improve-imgsli"
  chmod 755 "$pkgdir/usr/bin/improve-imgsli"
}
