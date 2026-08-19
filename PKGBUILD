# PKGBUILD
pkgname=majestic-linux-runner-git
pkgver=r86.765b2b7
pkgrel=1
pkgdesc="Python orchestration runner for Majestic RP on Linux via Proton"
arch=('any')
url="https://github.com/j0kertrup/majestic-rp-linux"
license=('MIT')
depends=('python' 'asar' 'cmake' 'mingw-w64-gcc')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'git')
provides=('majestic-linux-runner')
conflicts=('majestic-linux-runner')
source=("git+https://github.com/j0kertrup/majestic-rp-linux.git"
        "majestic-linux.desktop"
        "majestic-linux.png")
sha256sums=('SKIP'
            'f0b970bc44b34bd04f1a994b8f45901e0ee118491423895eab4d624a330cf1a7'
            '446abf0e2e7c856f55ae95c1794fa3746832567531fc5a6f678038b618b438a2')

pkgver() {
    cd majestic-rp-linux
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd majestic-rp-linux
    python -m build --wheel --no-isolation
}

package() {
    cd majestic-rp-linux
    python -m installer --destdir="$pkgdir" dist/*.whl
    
    install -Dm644 ../majestic-linux.desktop "$pkgdir/usr/share/applications/majestic-linux.desktop"
    install -Dm644 ../majestic-linux.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/majestic-linux.png"
}
