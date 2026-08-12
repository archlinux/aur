# Maintainer: forvkusa <forvkusa+aur at csie dot ntu dot edu dot tw>

pkgname=python-i3-workspace-names-daemon
_name=${pkgname#python-}
pkgver=0.15.0
pkgrel=1
pkgdesc="A daemon script to dynamically update workspace names in i3wm based on their content"
arch=('any')
url="https://github.com/cboddy/i3-workspace-names-daemon"
license=('MIT')
depends=(
  'python'
  'python-i3ipc'
  'i3-wm'
)
optdepends=(
  'otf-font-awesome'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)

_commit=87ad24722da0b85df54893ebac9cb8cbd53997ac
source=(
  "${_name}-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/i/${_name}/${_name}-$pkgver.tar.gz"
  "LICENSE-$pkgver::https://raw.githubusercontent.com/cboddy/${_name}/${_commit}/LICENSE"
)
sha256sums=(
  '25956d6864315e1b22a6732443d1f5db63fd0594cc43112e204f055aed1ba0df'
  '0ee73d556302f0cc3ee7564683e7f8c8cff1043533d749c130165e3372d1b941'
)

build() {
  cd "${_name}-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 "$srcdir/LICENSE-$pkgver" -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
