# Maintainer: Giorgio Gilestro <giorgio@gilest.ro>
pkgname=claude-monitor-git
pkgver=r73.63367dc
pkgrel=1
pkgdesc="A real-time terminal monitoring tool for Claude AI token usage"
arch=('any')
url="https://github.com/Maciek-roboblog/Claude-Code-Usage-Monitor"
license=('MIT')
depends=('python>=3.8' 'python-pytz' 'python-rich')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-hatchling')
provides=('claude-monitor')
conflicts=('claude-monitor')
source=("git+https://github.com/Maciek-roboblog/Claude-Code-Usage-Monitor.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/Claude-Code-Usage-Monitor"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/Claude-Code-Usage-Monitor"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/Claude-Code-Usage-Monitor"
    python -m installer --destdir="$pkgdir" dist/*.whl
    
    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
