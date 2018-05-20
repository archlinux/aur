# $Id$
# Maintainer: dreieck

_pkgname=cups-print-to-programme
pkgname="${_pkgname}"
_pkgver=0.1
pkgver="${_pkgver}"
pkgrel=0.5
pkgdesc="Print filter for cups which prints to a file (type: ) and opens that with a programme the user can choose in the settings."
arch=('any')
depends=(
  'cups'
  'mariadb' # For the 'replace'-executable.
)
install=cups-programme.install
url=""
license=('GPL3')
source=(
  "cups-programme.sh"
  "cups-programme.conf"
  "README.md"
  "GPL3.txt"
  "${install}"
)
optdepends=(
  'x11-ssh-askpass: For a graphical password input frontend for sudo.'
  'lxqt-openssh-askpass: For a graphical password input frontend for sudo.'
  'kde-cli-tools: For kdesu graphical frontend to run command as different user.'
  'kdesudo: For kdesudo graphical frontend to run command as different user.'
)
backup=('etc/cups/cups-programme.conf')
sha256sums=(
 '9a7f1cf4e52cebd2e1894a7f157a4aa087a5c4125b61e4781167ef70ec1ace5e'
 'e7b6bff5cf14045dfa56860ab422ac64d36c79624d6cc2d2e31d03dff71ae9eb'
 'SKIP'
 '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
 'SKIP'
)


package() {
  cd "${srcdir}"
  
  _backend_name="$(./cups-programme.sh | awk '{print $2}')"
  install -v -m 755 -D "cups-programme.sh" "${pkgdir}/usr/lib/cups/backend/${_backend_name}"
  
  install -v -m 644 -D "cups-programme.conf" "${pkgdir}/etc/cups/cups-programme.conf"
  
  install -v -m 644 -D "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
