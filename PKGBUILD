# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Robert Knauer <robert@privatdemail.net>
# Contributor: Elena ``of Valhalla'' Grandi <elena.valhalla@gmail.com>

pkgname=pdfposter
pkgver=0.8.1
pkgrel=1
pkgdesc='Print large posters on multiple sheets'
arch=('any')
url='https://gitlab.com/pdftools/pdfposter'
license=('GPL3')
depends=(python-pypdf2)
makedepends=(python-{build,installer,setuptools,wheel})
checkdepends=(python-pytest)
source=("https://gitlab.com/pdftools/pdfposter/-/archive/v${pkgver}/pdfposter-v${pkgver}.tar.bz2")
b2sums=('fb724191fe5bb639f3e1a60c744975c0e26bc713ab6bac739c71d0ad3273bebb6edd1493e032a4beb7a86bd68dfdc2bed49a85e8cf3487f35c7841baeac53399')

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
