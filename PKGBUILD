# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname='yandex-tank'
pkgver='1.9.10'
pkgrel='1'
pkgdesc='Performance measurement tool'
arch=('any')
url="https://github.com/yandex/${pkgname}"
license=('GPL')
depends=('python2' 'python2-psutil' 'python2-numpy' 'python2-future' 'python2-pandas' 'python2-paramiko' 'python2-requests' 'phantom')
makedepends=('python2' 'python-setuptools' 'gzip')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('1ebe0f82299e93ca0b9a3bdb3b6ca2269459184ec378561a3e2b7eedd86bf0a1')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}/data"
  gzip -f -9 load.conf.1 > load.conf.1.gz
  gzip -f -9 ${pkgname}.1 > ${pkgname}.1.gz
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install -O1 --skip-build --root="${pkgdir}"
  install -Dm0644 "data/load.conf.1.gz" "${pkgdir}/usr/share/man/man1/load.conf.1.gz"
  install -Dm0644 "data/${pkgname}.1.gz" "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
}
