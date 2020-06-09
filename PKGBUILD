# Maintainer: Andrew Sun <adsun701 at gmail dot com>

pkgname=2ping
pkgver=4.4.1
pkgrel=1
pkgdesc="a bi-directional ping utility"
arch=('any')
url="https://www.finnie.org/software/2ping/"
license=("GPL2")
depends=('python-dnspython' 'python-netifaces' 'python-pycryptodome')
makedepends=('python-setuptools')
optdepends=('bash-completion: for bash auto-completion')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/rfinnie/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('d075dbf7cbce259a1f4021a979aeeddde2574437ce5e74b444d7282de462039e')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python3 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python3 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build

  install -Dm644 2ping.service "${pkgdir}/usr/lib/systemd/system/2ping.service"
  install -Dm644 2ping.bash_completion "${pkgdir}/usr/share/bash-completion/completions/2ping"

  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/2ping/COPYING"
}
