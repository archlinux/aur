# Maintainer: Masoud Gholypour  Masoudgholypour2000@gmail.com
pkgname=mallama
pkgver=0.1.4
pkgrel=1
pkgdesc="A beautiful web interface for Ollama with conversation management and markdown support"
arch=('any')
url="https://github.com/yourusername/mallama"
license=('MIT')
depends=('python' 'python-flask' 'python-requests' 'ollama' 'python-werkzeug')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mesut2ooo/mallama/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    
    # Create systemd service file
    install -Dm644 "$srcdir/$pkgname-$pkgver/mallama.service" "$pkgdir/usr/lib/systemd/system/mallama.service"
    
    # Create configuration directory
    install -dm755 "$pkgdir/etc/mallama"
}