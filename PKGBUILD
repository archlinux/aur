pkgname="certbot-openmeetings"
pkgver=0.0.2
pkgrel=1
pkgdesc="Script to automate SSL certificate updates using certbot"
arch=('any')
url="https://github.com/snuglinux/${pkgname}"
license=('GPL2')
depends=("bash" "certbot" "openmeetings")
source=("https://github.com/snuglinux/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('b3ddaf7b7b19285568ecf48f850434a3')
backup=( "etc/${pkgname}.conf" )

package(){
  cd "$srcdir/${pkgname}-${pkgver}"

  # Create folders
  install -d "${pkgdir}/etc/letsencrypt/renewal-hooks/deploy"
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -d "${pkgdir}/usr/share/${pkgname}"
  install -d "${pkgdir}/var/log/${pkgname}"

  # Copy files
  install -m755 ${pkgname}              "${pkgdir}/etc/letsencrypt/renewal-hooks/deploy/${pkgname}"
  install -m644 README.md               "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm 644 COPYING               "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 ${pkgname}.conf       "${pkgdir}/etc/${pkgname}.conf"

  install -m644 ${pkgname}.messages     "${pkgdir}/usr/share/${pkgname}"

  sed -e "s/CURRENT_VERSION=0.0.0/CURRENT_VERSION=${pkgver}/" -i "${pkgdir}/etc/letsencrypt/renewal-hooks/deploy/${pkgname}"
}

