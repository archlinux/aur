# Maintainer: Darian Alberto Camacho Salas <xonidu@gmail.com>

pkgname=xonimet
pkgver=2.1.0
pkgrel=4
pkgdesc="Extractor universal de metadatos para fotos, audio, video y documentos. Genera reportes PDF."
arch=('any')
url="https://github.com/XONIDU/xonimet"
license=('MIT')
depends=('python' 'ffmpeg')
makedepends=('python-pip')
optdepends=('ffmpeg: necesario para extraer metadatos de videos')
source=("$pkgname-$pkgver.tar.gz::https://github.com/XONIDU/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    
    # Instalar dependencias Python con pip (sin --user ni --prefix juntos)
    pip install --break-system-packages --target="$pkgdir/usr/lib/python3.14/site-packages" \
        pillow \
        mutagen \
        ffmpeg-python \
        pypdf2 \
        python-docx \
        openpyxl \
        python-pptx \
        exifread \
        reportlab
    
    # Instalar binario principal
    install -Dm755 start.py "$pkgdir/usr/bin/$pkgname"
    
    # Instalar programa principal
    install -Dm755 xonimet.py "$pkgdir/usr/share/$pkgname/$pkgname.py"
}
