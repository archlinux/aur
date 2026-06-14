# Maintainer: Yannick Winkler <jaxterlp@gmail.com>

pkgname=aurora-update-assistant
_pkgname=aurora
pkgver=1.0.0
pkgrel=1
pkgdesc="A lightweight Linux assistant/helper with systemd timer support"
arch=('any')
url="https://github.com/Itsayannick03/aurora"
license=('GPL-3')
depends=(
  'python'
  'python-rich'
  'systemd'
  'pacman-contrib'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
optdepends=(
  'bash: for optional shell integration'
)
install=aurora.install
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  "aurora.service"
  "aurora.timer"
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
)

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 "$srcdir/aurora.service" \
    "$pkgdir/usr/lib/systemd/user/aurora.service"

  install -Dm644 "$srcdir/aurora.timer" \
    "$pkgdir/usr/lib/systemd/user/aurora.timer"
}
