# Maintainer: Ewout van Mansom <ewout@vanmansom.name>
pkgname=smfc
pkgver=2.2.0
pkgrel=1
pkgdesc="Super Micro Fan Control"
arch=(any)
install=smfc.install
backup=('etc/default/smfc' 'opt/smfc/smfc.conf')
url="https://github.com/petersulyok/smfc"
license=('GPL3')
depends=(python syslog-ng)
checkdepends=(flake8 python-coverage python-pylint python-pytest python-pytest-cov)
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('04b9fe4ab3be463c619f129e457a9e6d14a413337ae1a042016edc586c81fc05')

check() {
  cd "${pkgname}-${pkgver}"
  pytest
}

package() {
  cd "${pkgname}-${pkgver}"

  install -o root -g root -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd src
  install -o root -g root -Dm755 smfc.py "${pkgdir}/opt/smfc/smfc.py"
  install -o root -g root -Dm644 smfc.conf "${pkgdir}/opt/smfc/smfc.conf"
  install -o root -g root -Dm644 smfc "${pkgdir}/etc/default/smfc"
  install -o root -g root -Dm644 smfc.service "${pkgdir}/usr/lib/systemd/system/smfc.service"
}
