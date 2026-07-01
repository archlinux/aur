# Maintainer: Stewart <goodmans at protonmail dot com>

pkgname=pricehist
pkgdesc='A command-line tool for fetching and formatting historical price data, with
support for multiple data sources and output formats.'
pkgver=1.4.16
pkgrel=1
url='https://gitlab.com/chrisberkhout/pricehist'
license=('MIT')
arch=('any')

depends=('python-cssselect' 'python-lxml' 'python-requests' 'curlify')
makedepends=('python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel' 'python-poetry-core')

source=(
  "https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/${pkgname//-/_}-$pkgver.tar.gz"
)
sha256sums=(
  '63fba065ba67c6829c32796fae2cc34fe068db04a539df8c8c5329ef59f99395'
)

build() {
    cd "${pkgname//-/_}-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname//-/_}-$pkgver"
    python -m installer --destdir="$pkgdir" "dist/${pkgname//-/_}-$pkgver-"*.whl
}
