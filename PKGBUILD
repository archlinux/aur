# Maintainer: Sanidhya Kumar Verma <sanidhya.verma12345@gmail.com>
pkgname=infinix-mecha-bar
_github_repo='infinix-gtbook-mecha-bar'
pkgver=0.1.1
pkgrel=1
pkgdesc='Unofficial Linux CLI for Infinix GT Book rear Mecha bar (UART)'
arch=('any')
url="https://github.com/sanidhyy/$_github_repo"
license=('MIT')
depends=('python' 'python-pyserial')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
options=('!strip')
install=infinix-mecha-bar.install
source=("$_github_repo-$pkgver.tar.gz::https://github.com/sanidhyy/$_github_repo/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('95eaaac4ae0162857535d0f3acf4111c35e3554a8ddcfa3f944310f7614c5f9d')

build() {
  cd "$_github_repo-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_github_repo-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 aur/99-infinix-mecha-bar.rules "$pkgdir/usr/lib/udev/rules.d/99-infinix-mecha-bar.rules"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
