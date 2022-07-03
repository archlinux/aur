# Maintainer: Andrew Sun <adsun701 at gmail dot com>

pkgname=2ping
pkgver=4.5.1
pkgrel=1
pkgdesc="a bi-directional ping utility"
arch=('any')
url="https://www.finnie.org/software/2ping/"
license=("GPL2")
depends=('python-dnspython' 'python-netifaces'
         'python-pycryptodomex' 'python-distro' 'python-systemd')
makedepends=('python-setuptools')
optdepends=('bash-completion: for bash auto-completion')
source=("https://www.finnie.org/software/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('b56beb1b7da1ab23faa6d28462bcab9785021011b3df004d5d3c8a97ed7d70d8')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 2ping.service "${pkgdir}/usr/lib/systemd/system/2ping.service"
  install -Dm644 2ping.bash_completion "${pkgdir}/usr/share/bash-completion/completions/2ping"
  install -Dm644 COPYING.md "${pkgdir}/usr/share/licenses/2ping/COPYING.md"
}
