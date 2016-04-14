# Maintainer: Georg Pichler <georg.pichler@gmail.com>

pkgname=python2-cloudprint-git
pkgver=r157.5c33ff3
pkgrel=2
pkgdesc="Google cloudprint proxy"
arch=('any')
url="https://github.com/armooo/cloudprint"
license=('GPL')
makedepends=('git')
depends=('python2' 'python2-pycups' 'python2-requests' 'python2-argparse'
	'python2-setuptools')
source=("${pkgname}::git+https://github.com/armooo/cloudprint.git"
	"cloudprint.service"
	"cloudprint.default")
md5sums=('SKIP'
         'cc9c9a487358c08c76a2e01b08d119b5'
         '562dd123c5e4646e603679755ff01877')
options=(!emptydirs)
provides=('python2-cloudprint')
install='cloudprint.install'

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${pkgname}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  install -D "${srcdir}/cloudprint.default" "${pkgdir}/etc/default/cloudprint"
  install -D "${srcdir}/cloudprint.service" "${pkgdir}/usr/lib/systemd/system/cloudprint.service"
}
