# Maintainer: Darian Alberto Camacho Salas <xonidu@gmail.com>

pkgname=xonimet
pkgver=2.1.0
pkgrel=2
pkgdesc="Extractor universal de metadatos para fotos, audio, video y documentos. Genera reportes PDF."
arch=('any')
url="https://github.com/XONIDU/xonimet"
license=('MIT')
depends=('python' 'python-pip' 'ffmpeg')
makedepends=('python-pip' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/XONIDU/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    # Crear requirements.txt si no existe
    cat > requirements.txt << EOF
pillow>=10.0.0
mutagen>=1.46.0
ffmpeg-python>=0.2.0
pypdf2>=3.0.0
python-docx>=0.8.11
openpyxl>=3.1.0
python-pptx>=0.6.21
exifread>=3.0.0
reportlab>=4.0.0
EOF
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    
    # Instalar dependencias Python con pip
    pip install --user --break-system-packages --prefix="$pkgdir/usr" -r requirements.txt
    
    # Instalar binario principal
    install -Dm755 start.py "$pkgdir/usr/bin/$pkgname"
    
    # Instalar programa principal
    install -Dm755 xonimet.py "$pkgdir/usr/share/$pkgname/$pkgname.py"
    
    # Instalar documentacion
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md" 2>/dev/null || true
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 2>/dev/null || true
}
