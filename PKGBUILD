# Maintainer : Marcos Heredia <chelqo@gmail.com>

pkgname=smartshine
pkgver=0.36
pkgrel=2
_pyver=2
_pyrel=2.7
pkgdesc="SmartShine Photo - automation for the photographers"
arch=('i686' 'x86_64')
url="https://launchpad.net/smartshine"
license=('GPL3')
depends=("aaphoto" "python${_pyver}" "gtk2" "pyexiv2" "python2-imaging")
install=${pkgname}.install
source=("https://launchpad.net/${pkgname}/trunk/${pkgver}/+download/${pkgname}_${pkgver}.orig.tar.gz")
md5sums=('4abab2b3749777fdb5ab58d03ef26055')

build() {
  cd $srcdir/$pkgname-$pkgver
  python${_pyrel} setup.py build
  echo -e "#!/bin/sh\n\npython${_pyver} /usr/lib/python${_pyrel}/site-packages/smartshine/smartshine.py" >bin/smartshine
}

package() {
  cd $srcdir/$pkgname-$pkgver
  python${_pyver} setup.py install --root=$pkgdir --optimize=1
  _docdir=${pkgdir}/usr/share/doc/${pkgname}-${pkgver}
  _licdir=${pkgdir}/usr/share/licenses/${pkgname}
  _pngdir=${pkgdir}/usr/share/pixmaps
  _appdir=${pkgdir}/usr/share/applications
  install -dpm755 ${_docdir} ${_licdir} ${_pngdir} ${_appdir}
  install -Dpm644 Changelog TODO ${_docdir}/
  install -Dpm644 LICENSE ${_licdir}/
  install -Dpm644 smartshine.desktop ${_appdir}/
  cd ${_pngdir} ; ln -s ../../lib/python${_pyrel}/site-packages/smartshine/images/smartshine.png .
}
