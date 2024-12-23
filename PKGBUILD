# Maintainer: envolution
# Contributor: Platon Pronko <platon7pronko@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname="pyp"
pkgver=1.1.0
pkgrel=3
pkgdesc="Easily run Python at the shell! Magical, but never mysterious."
arch=("any")
url="https://github.com/hauntsaninja/pyp"
license=("MIT")
depends=("python" "python-astunparse")
makedepends=("python-build" "python-installer" "python-wheel" "python-flit-core")
source=("$pkgname-pkgver.tar.gz::https://github.com/hauntsaninja/pyp/archive/v${pkgver}.tar.gz")
sha256sums=('1c6a843ee6eb85304f4ad170958ba5decd72964d1936ed4460a72d02b696f543')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
  install -Dm644 README.md "$pkgdir"/usr/share/doc/"$pkgname"/README
  python -m installer --destdir="$pkgdir" dist/*.whl
}
# vim:set ts=2 sw=2 et:
