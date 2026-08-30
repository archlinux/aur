pkgname=plasmarchy
pkgver=0.1.0rc1
pkgrel=1
pkgdesc='Port Omarchy themes and shell plugins into native KDE Plasma packages'
arch=('any')
url='https://github.com/majesticio/plasmarchy'
license=('MIT')
depends=('python>=3.11' 'git')
optdepends=('plasma-workspace: enable and use generated Plasma packages'
            'kio: launch applications and files from the Omalaunch recipe'
            'libqalculate: Omalaunch calculations and conversions'
            'fd: fast Omalaunch file search'
            'wl-clipboard: copy Omalaunch results on Wayland')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/majesticio/plasmarchy/releases/download/v0.1.0rc1/plasmarchy-0.1.0rc1.tar.gz")
sha256sums=('cfc80247f61fae2a31a5c4322c9986bc820f3891f18a1320c7e6ba2c09d7287b')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname-$pkgver"
  python -m compileall -q src
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
