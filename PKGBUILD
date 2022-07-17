# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Robert Knauer <robert@privatdemail.net>
# Contributor: Elena ``of Valhalla'' Grandi <elena.valhalla@gmail.com>

pkgname=pdfposter
pkgver=0.8
pkgrel=1
pkgdesc='Print large posters on multiple sheets'
arch=('any')
url='https://gitlab.com/pdftools/pdfposter'
license=('GPL3')
depends=(python-pypdf2)
makedepends=(python-{build,installer,setuptools,wheel})
checkdepends=(python-pytest)
source=("https://gitlab.com/pdftools/pdfposter/-/archive/v${pkgver}/pdfposter-v${pkgver}.tar.bz2")
b2sums=('8d77a54d1680b86831a80d8c2987795f8d972405ab2a84857021e422e2d7272f530a032d980e1ac4f87f2a12f680b7d7d569ed35553a034fba2c2160dfaf9e99')

build() {
  cd ${pkgname}-v${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname}-v${pkgver}
  python -m pytest test/unit
}

package() {
  cd ${pkgname}-v${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
