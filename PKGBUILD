# Maintainer: Andrew Sun <adsun701 at gmail dot com>

pkgname=2ping
pkgver=4.5
pkgrel=2
pkgdesc="a bi-directional ping utility"
arch=('any')
url="https://www.finnie.org/software/2ping/"
license=("GPL2")
depends=('python-dnspython' 'python-netifaces' 'python-pycryptodome'
         'python-pycryptodomex' 'python-distro')
makedepends=('python-setuptools')
optdepends=('bash-completion: for bash auto-completion')
source=("https://www.finnie.org/software/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('867009928bf767d36279f90ff8f891855804c0004849f9554ac77fcd7f0fdb7b')

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
