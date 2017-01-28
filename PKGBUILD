#Maintainer: Jan Koppe <post@jankoppe.de>
pkgname=pyca
pkgver=1.0.1
pkgrel=4
pkgdesc="Python Capture Agent for Opencast"
arch=('any')
url="https://github.com/opencast/pyCA"
license=('LGPL')
depends=('gnutls' 'python-pycurl' 'python-icalendar' 'python-dateutil' 'python-configobj')
source=("https://github.com/opencast/pyCA/archive/v$pkgver.tar.gz"
        "pyca.install"
        "pyca.service"
        "pyca")
install="pyca.install"
md5sums=("866718b5e665b7f9404c7e4875f38392"
         "234a749da650e5fcd89a49b358c0d5ec"
         "77664b1ea9ceaba7c091c285737f402e"
         "e29e06fbdba00a201f816db88be5c7bf")

prepare() {
  cd pyCA-"${pkgver}"

  sed -i 's/directory\s*=.*/directory = \/var\/lib\/pyca\/recordings\//' etc/pyca.conf
}

package() {
  cd pyCA-"${pkgver}"

  install -Dm 644 "${srcdir}"/pyca.service "${pkgdir}"/usr/lib/systemd/system/pyca.service

  install -dm 755 "${pkgdir}"/var/lib/pyca/recordings
  install -dm 755 "${pkgdir}"/usr/lib/python3.6/site-packages/pyca

  install -Dm 644 etc/pyca.conf "${pkgdir}"/etc/pyca.conf

  install -Dm 755 pyca/* "${pkgdir}"/usr/lib/python3.6/site-packages/pyca
  install -Dm 755 "${srcdir}"/pyca "${pkgdir}"/usr/bin/pyca
}
