# Maintainer: Letu Ren <fantasquex at gmail dot com>
# Contributor: t-onoz <t [dot] onozuka [dot] 1990 [at] (g-mail)>
pkgname=safety
pkgver=2.3.5
pkgrel=1
pkgdesc="Safety checks Python dependencies for known security vulnerabilities and suggests the proper remediations for vulnerabilities detected."
arch=('any')
url="https://github.com/pyupio/safety"
license=('MIT')
depends=(
  'python'
  'python-setuptools'
  'python-click'
  'python-requests'
  'python-packaging'
  'python-dparse'
  'python-ruamel-yaml'
)
makedepends=(
  'python-build'
  'python-installer'
)
optdepends=(
  'python-pygithub: github'
  'python-jinja: github'
  'python-gitlab: gitlab'
)
source=("https://github.com/pyupio/safety/archive/${pkgver}.tar.gz")
sha256sums=('d48474d59cf14b6ccaa9cd1f56a4dae7678abed56638ecc81e57220d9b0537ca')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
