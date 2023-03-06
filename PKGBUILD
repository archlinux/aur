pkgname=smail
pkgver=0.1.2
pkgrel=1
pkgdesc="smail - BASH script to send emails via SMTP SSL."
arch=('any')
url="https://github.com/snuglinux/${pkgname}"
license=('GPL2')
depends=("bash" "openssl" "grep")
source=("https://github.com/snuglinux/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('a0137bfd572d11c07683c918abe075e9')
backup=( "etc/${pkgname}.conf" )
install=${pkgname}.install

package(){
  cd "$srcdir/${pkgname}-${pkgver}"

  # Create folders
  install -d "${pkgdir}/etc"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -d "${pkgdir}/usr/share/${pkgname}"
  install -d "${pkgdir}/var/log/smail"

  # Copy files
  install -m754 ${pkgname}     "${pkgdir}/usr/bin"
  install -m754 addmail        "${pkgdir}/usr/bin"
  install -m644 smail.conf     "${pkgdir}/etc"
  install -m644 README.md      "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm 644 COPYING      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -m644 ${pkgname}.messages  "${pkgdir}/usr/share/${pkgname}"
  install -m644 addmail.messages     "${pkgdir}/usr/share/${pkgname}"
  sed -e "s/SMAIL_VER=0.0.0/SMAIL_VER=${pkgver}/" -i "${pkgdir}/usr/bin/${pkgname}"
}

