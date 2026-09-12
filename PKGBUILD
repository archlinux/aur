# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from GLM 5.3 Flash.

options=('!debug')

pkgname=xl-converter
pkgver=1.3.0
pkgrel=1
pkgdesc="Easy-to-use image converter for modern formats (JPEG XL, AVIF, JPEGLI, WebP)"
arch=('any')
url="https://github.com/JacobDev1/xl-converter"
license=('GPL-3.0-only')
depends=(
    'python'
    'python-pyqt6'
    'pyside6'
    'python-send2trash'
    'libjxl'
    'libavif'
    'imagemagick'
    'oxipng'
    'perl-image-exiftool'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/JacobDev1/xl-converter/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b04e14dcd4d53ba6c433a12c4095233b34370436341280acd5b4be8df3af8ca7')

package() {
    cd "xl-converter-$pkgver"

    install -dm755 "$pkgdir/opt/$pkgname"
    cp -r . "$pkgdir/opt/$pkgname/"

    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/$pkgname" <<EOF
#!/bin/sh
exec python /opt/$pkgname/main.py "\$@"
EOF
    chmod +x "$pkgdir/usr/bin/$pkgname"

    install -Dm644 assets/icons/logo.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"

    install -dm755 "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/$pkgname.desktop" <<EOF
[Desktop Entry]
Name=XL Converter
Comment=Image converter for modern formats
Exec=$pkgname
Icon=$pkgname
Terminal=false
Type=Application
Categories=Graphics;
EOF
}