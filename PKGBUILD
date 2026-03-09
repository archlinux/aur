# Maintainer: Antonin Godard <antonin dot godard at pm dot me>

_base='systemdunitparser'
pkgname="python-$_base"
pkgver=0.4
pkgrel=1
pkgdesc='Parser for systemd unit files'
url='https://github.com/sgallagher/systemdunitparser'
arch=('any')
license=('GPL-3.0-or-later')
makedepends=(
  python-build
  python-installer
  python-wheel
)
provides=("${pkgname}=${pkgver}")
source=("${url}/archive/${pkgver}.tar.gz")
sha512sums=('c4939d27eb8b9a8700e32efa2e2718a028a095c166f0702622b255b55b5643118e29746aa91e08f0fc2666e99c371d9612a464e7b2ce6ee2ce4573fbf79b5858')

build() {
  cd "${srcdir}/${_base}-${pkgver}"
  python -m build --wheel --no-isolation -x
}

package() {
  cd "${srcdir}/${_base}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ft=PKGBUILD ts=2 sw=2 et:
