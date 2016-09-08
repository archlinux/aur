# Maintainer: Stuart Mumford <stuart@cadair.com>
pkgname=python-openzwave
pkgver=0.3.1
pkgrel=1
pkgdesc="The python-openzwave package without the web component. Used with home-assistant."
arch=(any)
url="https://github.com/OpenZWave/python-openzwave"
license=('BSD')
depends=('python' 'python-pydispatcher' 'python-urwid')
options=(!emptydirs)
source=("https://github.com/OpenZWave/python-openzwave/raw/master/archives/${pkgname}-${pkgver}.tgz")
sha256sums=('829df24774289a8dc8bd6415b57b94dd4f9eb7ec2cb00c49a6c9e4a5068eb0e5')

package() {
  cd "$srcdir/${pkgname}-$pkgver"
  make build
  installdir=${pkgdir}/lib/python3.5/site-packages/
  mkdir -p ${installdir}
  export PYTHONPATH=${installdir}
  echo $PYTHONPATH
  python setup-lib.py install --single-version-externally-managed --root ${pkgdir}
  python setup-api.py install --single-version-externally-managed --root ${pkgdir}
  python setup-manager.py install --single-version-externally-managed --root ${pkgdir}
  #python setup-web.py install --single-version-externally-managed --root ${pkgdir}
}

# vim:set ts=2 sw=2 et:
