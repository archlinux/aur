# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>
# Maintainer: Fred Lins <fredcox at gmail dot com>
# install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
pkgname=crazydiskmark
pkgver=0.7.3
pkgrel=1
pkgdesc='Linux disk benchmark tool like CrystalDiskMark'
arch=('any')
url='https://github.com/fredcox/crazydiskmark'
license=('MIT')
depends=('python-pyqt5'
         'python-coloredlogs'
         'python-humanfriendly'
         'fio')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://pypi.io/packages/source/c/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=(c30509ed2c7026863e9db19b88a83b9b5eab6f9e8834d2d2790b9f2ee2c1f9db)
build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}
package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  mkdir -p "$pkgdir/usr/share/applications/"
  install -Dm644 "${pkgname}"/"${pkgname}".desktop "$pkgdir/usr/share/applications/"

  mkdir -p "$pkgdir/usr/share/icons/hicolor/48x48/apps/"
  install -Dm644 "${pkgname}"/images/crazydiskmark_icon.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"


}
# vim:set ts=2 sw=2 et:
