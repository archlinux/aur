# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Robert Knauer <robert@privatdemail.net>
# Contributor: Elena ``of Valhalla'' Grandi <elena.valhalla@gmail.com>

pkgname=pdfposter
pkgver=0.9
pkgrel=1
pkgdesc='Print large posters on multiple sheets'
arch=('any')
url='https://gitlab.com/pdftools/pdfposter'
license=('GPL3')
depends=(python-pypdf)
makedepends=(python-{build,installer,setuptools,wheel})
checkdepends=(python-pytest)
source=("https://gitlab.com/pdftools/pdfposter/-/archive/v${pkgver}/pdfposter-v${pkgver}.tar.bz2")
b2sums=('73e98104c36f78b8a9f08b5b4ead64e8faad6f17e97d20878beb739170ab4187a268b08f5d43a11c1b9ba86f7e6949816664258c50fe3085eab5bf04b22ecc45')

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
