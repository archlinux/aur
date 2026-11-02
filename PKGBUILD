# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: Diego Garcia <diego.garcia.cr at gmail.com>

pkgname=python-selenium-bin
_pkgname=selenium
pkgver=4.52.0
pkgrel=1
pkgdesc="Python language bindings for Selenium WebDriver (build from wheel)"
arch=(x86_64)
url="https://github.com/SeleniumHQ/selenium"
license=(Apache-2.0)
depends=(
  bzip2
  gcc-libs
  glibc
  python
  python-certifi
  python-trio
  python-trio-websocket
  python-typing_extensions
  python-urllib3
  python-websocket-client
  zlib
)
makedepends=(python-installer)
conflicts=(python-selenium)
provides=(python-selenium)
options=(!lto)
source=("https://files.pythonhosted.org/packages/py3/${_pkgname::1}/$_pkgname/${_pkgname//-/_}-${pkgver}-py3-none-any.whl")
sha256sums=('caa2860d486f71cdeb21fee3248c2f604bba590120dfb4d3d18c4d7cf97c6f1f')

package() {
  python -m installer --destdir="${pkgdir}" "selenium-${pkgver}-py3-none-any.whl"

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  cp selenium/webdriver/remote/*.js "${pkgdir}/${site_packages}/selenium/webdriver/remote"
  cp selenium/webdriver/common/*.js "${pkgdir}/${site_packages}/selenium/webdriver/common"
}
