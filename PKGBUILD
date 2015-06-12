# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Martin Stolpe <martinstolpe [at] gmail ... com>
pkgname=bzr-explorer
_majorver=1.3
pkgver=${_majorver}.0
pkgrel=3
pkgdesc="A desktop application for using the Bazaar Version Control System"
arch=('any')
url="http://doc.bazaar.canonical.com/explorer/en/"
license=('GPL')
depends=("python2>=2.4" "python2-pyqt>=4.4" "bzr>=2.3" "qbzr>=0.18" "hicolor-icon-theme")
optdepends=("x11-ssh-askpass")
install="${pkgname}.install"
source=(http://launchpad.net/bzr-explorer/${_majorver}/$pkgver/+download/$pkgname-$pkgver.tar.gz)
md5sums=('7d1de6a744a1daf4b194885209cf67c4')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  python2 setup.py install --skip-build --prefix=$pkgdir/usr

  install -D -m 644 ${srcdir}/${pkgname}-${pkgver}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
  sed -i 's/#Icon/Icon/g' ${pkgdir}/usr/share/applications/${pkgname}.desktop

  install -D -m 644 ${srcdir}/${pkgname}-${pkgver}/data/bzr-16.png ${pkgdir}/usr/share/icons/hicolor/16x16/apps/bzr.png
  install -D -m 644 ${srcdir}/${pkgname}-${pkgver}/data/bzr-32.png ${pkgdir}/usr/share/icons/hicolor/32x32/apps/bzr.png
  install -D -m 644 ${srcdir}/${pkgname}-${pkgver}/data/bzr-48.png ${pkgdir}/usr/share/icons/hicolor/48x48/apps/bzr.png
}
