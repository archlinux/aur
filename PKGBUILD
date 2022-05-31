pkgname="bareos-scripts"
pkgver=0.0.2
pkgrel=1
arch=('any')
url="https://github.com/snuglinux/${pkgname}"
license=('GPL2')
depends=("python2-bareos")
source=("https://github.com/snuglinux/${pkgname}/archive/${pkgver}.zip")
md5sums=('e061869925ae5faf7c807649e2dc4cb1')
backup=("etc/systemd/system/bareos-incoming-connect@.timer.d/bareos-incoming-connect.conf"
        "etc/bareos/bareos-scripts.conf")
install=${pkgname}.install

package(){
  cd "$srcdir/${pkgname}-${pkgver}"

  # Create folders
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -d "${pkgdir}/etc/bareos/"
  install -d "${pkgdir}/etc/systemd/system/bareos-incoming-connect@.timer.d"
  install -d "${pkgdir}/usr/lib/systemd/system"

  # Copy files
  install -m644 bareos-scripts.conf  "${pkgdir}"/etc/bareos/bareos-scripts.conf
  install -m644 systemd/bareos-incoming-connect@.timer.d/bareos-incoming-connect.conf \
                "${pkgdir}"/etc/systemd/system/bareos-incoming-connect@.timer.d/bareos-incoming-connect.conf
  install -m644 systemd/bareos-incoming-connect@.{service,timer} \
                "${pkgdir}"/usr/lib/systemd/system/

  install -m644 README.md                 "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm 644 COPYING                 "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -m755 bareos-incoming-connect   "${pkgdir}/usr/bin"
}

