pkgname="mysql-db-backup"
pkgver=0.0.4
pkgrel=2
pkgdesc="A script for automatically archiving MySQL databases."
arch=('any')
url="https://github.com/snuglinux/${pkgname}"
license=('GPL2')
depends=("bash" "mariadb-clients")
optdepends=("smail")
source=("https://github.com/snuglinux/${pkgname}/archive/${pkgver}.zip")
md5sums=('09d0390787667aad8b8e32961c6727cb')
backup=( "etc/${pkgname}/${pkgname}.conf" "usr/lib/systemd/system/${pkgname}.timer.d/${pkgname}.conf" )
install=${pkgname}.install

package(){
  cd "$srcdir/${pkgname}-${pkgver}"

  # Create folders
  install -d "${pkgdir}/etc"
  install -d "${pkgdir}/etc/${pkgname}/hosts"
  install -d "${pkgdir}/etc/sudoers.d"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -d "${pkgdir}/usr/lib/systemd/system/"
  install -d "${pkgdir}/usr/share/${pkgname}"
  install -d "${pkgdir}/usr/lib/systemd/system/${pkgname}.timer.d"
  install -d "${pkgdir}/var/log/${pkgname}"

  # Copy files
  install -m755 ${pkgname}                  "${pkgdir}/usr/bin"
  install -m644 README.md                   "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm 644 COPYING                   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 etc/${pkgname}.conf       "${pkgdir}/etc/${pkgname}/${pkgname}.conf"
  install -Dm 644 etc/hosts/localhost.conf_ "${pkgdir}/etc/${pkgname}/hosts/localhost.conf_"
  install -Dm 644 etc/sudoers.d/${pkgname}  "${pkgdir}/etc/sudoers.d/${pkgname}"

  install -m644 ${pkgname}.messages         "${pkgdir}/usr/share/${pkgname}"
  install -m644 ${pkgname}.func             "${pkgdir}/usr/share/${pkgname}"
  install -m644 systemd/${pkgname}.timer    "${pkgdir}/usr/lib/systemd/system"
  install -m644 systemd/${pkgname}.service  "${pkgdir}/usr/lib/systemd/system"
  install -m644 systemd/${pkgname}.timer.d/${pkgname}.conf "${pkgdir}/usr/lib/systemd/system/${pkgname}.timer.d/${pkgname}.conf"

  sed -e "s/CURRENT_VERSION=0.0.0/CURRENT_VERSION=${pkgver}/" -i "${pkgdir}/usr/bin/${pkgname}"
}

