# Maintainer: Fred Lins <fredcox at gmail dot com>
# install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
pkgname=gonhang
pkgver=0.3.0
pkgrel=1
pkgdesc='GonhaNG is a System Monitor for several important hardware variables.'
arch=('any')
url='https://github.com/fredcox/gonhang'
conflicts=('gonha')
replaces=('gonha')
license=('MIT')
depends=('python-pyqt5'
         'python-psutil'
         'python-humanfriendly'
         'curl'
         'ttf-fira-code'
         'wmctrl'
         'hddtemp'
         'python-requests')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://pypi.io/packages/source/g/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=(f3ccab70d858ad0d197425b4c1762f45d275f679cb8c268f2b65454fe38c6916)
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
  install -Dm644 "${pkgname}"/images/gonhang_icon.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"


}
# vim:set ts=2 sw=2 et:
