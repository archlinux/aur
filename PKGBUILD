# Maintainer: Michael Lass <bevan@bi-co.net>
# Contributor: Fabio 'Lolix' Loli <lolix@disroot.org>
# Contributor: Alesh Slovak <aleshslovak@gmail.com>
# Contributor: Niels Martignène <niels.martignene@gmail.com>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=pycrc
pkgver=0.12.0
pkgrel=1
pkgdesc="Free, easy to use Cyclic Redundancy Check (CRC) calculator and C source code generator"
arch=(any)
url="https://pycrc.org"
license=('MIT')
depends=(python)
makedepends=(python-build python-hatchling python-installer python-wheel libxslt docbook-xsl)
source=("https://github.com/tpircher/pycrc/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('301509bddf838f608f155c8b35557e9c937c644cba4630775bb194395466fbd0')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation

    cd doc
    xsltproc /usr/share/xml/docbook/xsl-stylesheets/manpages/docbook.xsl pycrc.xml > pycrc.1
    gzip pycrc.1
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
    install -Dm644 doc/pycrc.1.gz "$pkgdir"/usr/share/man/man1/pycrc.1.gz
}
