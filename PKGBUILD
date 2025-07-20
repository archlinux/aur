# Maintainer: Giorgio Gilestro <giorgio@gilest.ro>
pkgname=claude-monitor-git
pkgver=3.0.4
pkgrel=1
pkgdesc="A real-time terminal monitoring tool for Claude AI token usage"
arch=('any')
url="https://github.com/Maciek-roboblog/Claude-Code-Usage-Monitor"
license=('MIT')
depends=('python>=3.9' 'python-httpx' 'python-rich' 'python-pytz' 'python-pydantic' 'python-pydantic-settings')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
provides=('claude-monitor-git')
conflicts=('claude-monitor')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Maciek-roboblog/Claude-Code-Usage-Monitor/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/Claude-Code-Usage-Monitor-$pkgver"
    /usr/bin/python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/Claude-Code-Usage-Monitor-$pkgver"
    /usr/bin/python -m installer --destdir="$pkgdir" dist/*.whl
    
    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
