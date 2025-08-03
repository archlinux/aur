# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Robert Knauer <robert@privatdemail.net>
# Contributor: Elena ``of Valhalla'' Grandi <elena.valhalla@gmail.com>

pkgname=pdfposter
pkgver=0.9.1
pkgrel=1
pkgdesc='Print large posters on multiple sheets'
arch=('any')
url='https://gitlab.com/pdftools/pdfposter'
license=('GPL3')
depends=(python-pypdf)
makedepends=(python-{build,installer,setuptools,wheel})
checkdepends=(python-pytest)
source=("https://gitlab.com/pdftools/pdfposter/-/archive/v${pkgver}/pdfposter-v${pkgver}.tar.bz2")
b2sums=('a8351acd1ce5a7df03de15fcf9ef11dc8976ce7997d493fe12d1037f900ea10e76bb994c6cc2fa36c23f0ab6693fcbe414c326b670ee63f044d630215dc5db82')

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
