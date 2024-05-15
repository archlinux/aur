# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname='python2-requests-unixsocket'
pkgver=0.3.0
pkgrel=2
pkgdesc='Use requests to talk HTTP via a UNIX domain socket (Python 2 package)'
arch=('any')
url="https://pypi.org/project/requests-unixsocket/${pkgver}/"
license=('Apache')
depends=('python2' 'python2-requests' 'python2-urllib3')
makedepends=('python2-pbr' 'python2-setuptools')
options=('!emptydirs')
_tarname="requests-unixsocket-${pkgver}"
source=("https://files.pythonhosted.org/packages/source/r/requests-unixsocket/${_tarname}.tar.gz")
sha256sums=('28304283ea9357d45fff58ad5b11e47708cfbf5806817aa59b2a363228ee971e')

build() {
  cd "${_tarname}"
  python2 setup.py build
}

package() {
  cd "${_tarname}"

  python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  echo 'Removing tests dir from package'
  local site_packages=$(python2 -c "import site; print(site.getsitepackages()[0])")
  rm -rfv "${pkgdir}${site_packages}/requests_unixsocket/tests"
}
