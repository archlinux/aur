# Maintainer: Sanidhya Kumar Verma <sanidhya.verma12345@gmail.com>
pkgname=byd-n16-rgb
_github_repo='byd-n16-kbd-rgb'
pkgver=0.1.2
pkgrel=1
pkgdesc='Unofficial Linux CLI for BYD N16 keyboard RGB (USB 340e:8002)'
arch=('any')
url="https://github.com/sanidhyy/$_github_repo"
license=('MIT')
depends=('python' 'python-hidapi')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
options=('!strip')
install=byd-n16-rgb.install
source=("$_github_repo-$pkgver.tar.gz::https://github.com/sanidhyy/$_github_repo/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('dc84a3b1deba1f2511c855175a7a44e5d023c0f910ebe42a690c3f7c113a3eec')

build() {
  cd "$_github_repo-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_github_repo-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 aur/99-byd-n16-rgb.rules "$pkgdir/usr/lib/udev/rules.d/99-byd-n16-rgb.rules"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
