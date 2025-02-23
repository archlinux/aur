# Maintainer: ThePirate42 <aur at thepirate42 dot org>

pkgname=mtp
pkgver=1.1.0
pkgrel=1
pkgdesc="Automated/interactive cryptanalysis for the Many-time pad attack"
arch=('any')
url="https://github.com/CameronLonsdale/${pkgname}"
license=('MIT')
provides=(python-mtp)
conflicts=(python-mtp)
depends=(python python-urwid)
makedepends=(python-build python-installer python-setuptools)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('a4b1cc296b1c56e8d490c03877c9f793a571e4b66d2ac72558bf446f56232846d94067b37a105b38babf092c070c8c537a2ed5d4462d85652fb1cfd9a621802a')

build(){
  cd "${srcdir}/MTP-${pkgver}"
  python -m build --wheel --no-isolation
}

package(){
  cd "${srcdir}/MTP-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "${site_packages}/${pkgname}-${pkgver}.dist-info/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
