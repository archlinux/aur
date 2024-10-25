# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: Nocifer <apmichalopoulos at gmail dot com>

pkgname=python-icoextract
_pkgname=${pkgname##python-}
pkgver=0.1.5
pkgrel=2
pkgdesc='Icon extractor for Windows PE files (.exe/.dll) with optional thumbnailer functionality.'
arch=('any')
url='https://github.com/jlu5/icoextract'
license=('MIT')
depends=(
  'python'
  'python-pefile'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
optdepends=('python-pillow: required for the optional thumbnailer')
provides=('exe-thumbnailer' 'icoextract')
conflicts=('exe-thumbnailer')
replaces=('exe-thumbnailer' 'icoextract')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jlu5/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('9eddf003b2188a1c81805836fd7bd9b157c6ed16d0db1b51121f2bb8bee1963a')

build() {
    cd ${_pkgname}-${pkgver}

    python -m build --wheel --no-isolation
}

package() {
    cd ${_pkgname}-${pkgver}

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 'exe-thumbnailer.thumbnailer' "${pkgdir}/usr/share/thumbnailers/exe-thumbnailer.thumbnailer"
    install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
