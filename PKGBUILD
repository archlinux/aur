# $Id$
# Maintainer: dreieck

_pkgname=cups-print-to-programme
pkgname="${_pkgname}"
pkgver=0.1
pkgrel=3
pkgdesc="Print filter for cups which prints to a file (type: ) and opens that with a programme the user can choose in the settings. For example, print to gimp."
arch=('any')
depends=(
  'cups'
  'mariadb' # For the 'replace'-executable.
)
install=cups-programme.install
url="http://felics.kettenbruch.de/software/cups-print-to-programme/"
license=('GPL3')
source=(
  "cups-programme.sh"
  "cups-programme.conf"
  "README.md"
  "GPL3.txt"
  "${install}"
)
optdepends=(
  "kde-cli-tools: For 'kdesu' graphical frontend to run command as different user."
  "kdesudo: For 'kdesudo' graphical frontend to run command as different user."
  "x11-ssh-askpass: For a graphical password input frontend for sudo."
  "lxqt-openssh-askpass: For a graphical password input frontend for sudo."
  "openssh-askpass: For a graphical password input frontend for sudo."
  "seahorse:  For a graphical password input frontend for sudo."
  "ksshaskpass: For a graphical password input frontend for sudo."
  "gnome-ssh-askpass2: For a graphical password input frontend for sudo."
)
provides=("${_pkgname}-doc=${pkgver}")
backup=('etc/cups/cups-programme.conf')
sha256sums=(
 '32015b7b1014003678c5e44da4a75211d6629c87596c5c338a9255a41de82260'
 'e7cb6af420fb7fdfa860a94480ddd75d89033f1f66c9b0489719e525a2b4c0cc'
 '31f6a2fd3d34dde35415681450057c5c8a730df8b1f015989018696ccd22cd3b'
 '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
 '0ee996783ae6848cf3c522de135646cb4b19670a48d6f1bf387b5b304f5506ad'
)

pkgver() {
  cd "${srcdir}"
  ./cups-programme.sh --version
}


package() {
  cd "${srcdir}"
  
  _backend_name="$(./cups-programme.sh | awk '{print $2}')"
  install -v -m 755 -D "cups-programme.sh" "${pkgdir}/usr/lib/cups/backend/${_backend_name}"
  
  install -v -m 644 -D "cups-programme.conf" "${pkgdir}/etc/cups/cups-programme.conf"
  
  install -v -m 644 -D "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  
  install -v -m 644 -D "GPL3.txt" "${pkgdir}/usr/share/licenses/${pkgname}/GPL3.txt"
}
