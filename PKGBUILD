# Maintainer: Nihal Kumar <2tv8xupqg at mozmail dot com>
# https://github.com/nihalxkumar/PKGBUILDs.git

pkgname=alix-git
_pkgname=alix-cli
pkgver=r178.f355086
pkgrel=1
pkgdesc="Interactive alias manager for your shell"
arch=('any')
url="https://github.com/TheDevOpsBlueprint/alix-cli"
license=('MIT')
depends=(
  'python'
  'python-click'
  'python-rich'
  'python-textual'
  'python-pyperclip'
  'python-yaml'
  'python-rapidfuzz'
  'python-psutil'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
provides=("$_pkgname" "alix")
conflicts=("$_pkgname" "alix")
source=("git+https://github.com/TheDevOpsBlueprint/alix-cli.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
