# Maintainer: Midov <midov@midov.pl>

pkgname=python-html-sanitizer
_name=html_sanitizer
pkgver=2.5.0
pkgrel=1
pkgdesc="Allowlist-based and very opinionated HTML sanitizer that can be used both for untrusted and trusted sources."
arch=('any')
url="https://pypi.org/project/html-sanitizer/"
license=('BSD-3-Clause')
depends=('python' 'python-lxml-html-clean')
makedepends=('python-setuptools' 'python-hatchling' 'python-build' 'python-installer')
optdepends=('python-django: Ships with a module that can use Django settings') 
source=("https://files.pythonhosted.org/packages/6a/71/84703065944d067694b1b63d69ff02a4248112ade0801353e51c5b522581/${_name}-${pkgver}.tar.gz")
sha256sums=('8878c2383070e8a5023814d621e4133d15f8c013ec9a5619be280739d56d6ec5')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 "${srcdir}/${_name}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
