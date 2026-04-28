# Maintainer: Darian Alberto Camacho Salas <xonidu@gmail.com>

pkgname=xonispam
pkgver=1.0.0
pkgrel=2
pkgdesc="Herramienta educativa de automatización de teclado para pruebas de spam"
arch=('any')
url="https://github.com/XONIDU/xonispam"
license=('MIT')
depends=('python' 'python-pyautogui')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/XONIDU/xonispam/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir"
    
    # El directorio se llama xonispam-1.0.0 (no xonispam-v1.0.0)
    local builddir="$srcdir/${pkgname}-${pkgver}"
    
    if [ ! -d "$builddir" ]; then
        builddir="$srcdir/${pkgname}-v${pkgver}"
    fi
    
    if [ ! -d "$builddir" ]; then
        builddir="$srcdir/${pkgname}"
    fi
    
    echo "Directorio de construcción: $builddir"
    ls -la "$builddir"
    
    # Crear directorios
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/$pkgname"
    install -dm755 "$pkgdir/usr/share/doc/$pkgname"
    
    # Instalar lanzador
    if [ -f "$builddir/start.py" ]; then
        install -Dm755 "$builddir/start.py" "$pkgdir/usr/bin/$pkgname"
    else
        echo "ERROR: No se encuentra start.py"
        ls -la "$builddir"
        exit 1
    fi
    
    # Instalar programa principal
    if [ -f "$builddir/xonispam.py" ]; then
        install -Dm644 "$builddir/xonispam.py" "$pkgdir/usr/share/$pkgname/xonispam.py"
    fi
    
    # Instalar documentación
    [ -f "$builddir/README.md" ] && install -Dm644 "$builddir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    [ -f "$builddir/requisitos.txt" ] && install -Dm644 "$builddir/requisitos.txt" "$pkgdir/usr/share/doc/$pkgname/requisitos.txt"
}
