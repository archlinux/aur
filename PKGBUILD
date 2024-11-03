pkgname=improve-imgsli
pkgver=1.2.0
pkgrel=1
pkgdesc="Image comparison tool with magnifying glass feature"
arch=('any')
url="https://github.com/Loganavter/Improve-ImgSLI"
license=('MIT')
depends=('python' 'python-pillow' 'python-pyqt5')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.zip::https://github.com/Loganavter/Improve-ImgSLI/archive/refs/heads/main.zip")
sha256sums=('fd51b7ce3a78fb452857ff43a3ba00c491b4857f1b316acf3a10ef9a79f0b70d')

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
    cd "$srcdir/Improve-ImgSLI-main"
    
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
    
    # Install icon
    install -m644 33.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/improve-imgsli.png"
    
    # Install .desktop file
    install -m644 "$srcdir/improve-imgsli.desktop" "$pkgdir/usr/share/applications/"
    
    # Create launcher script
    echo '#!/bin/sh' > "$pkgdir/usr/bin/improve-imgsli"
    echo 'exec python /usr/lib/improve-imgsli/Improve_ImgSLI.py "$@"' >> "$pkgdir/usr/bin/improve-imgsli"
    chmod 755 "$pkgdir/usr/bin/improve-imgsli"
}
