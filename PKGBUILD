# $Id$
# Maintainer: dreieck

_pkgname=cups-print-to-programme
pkgname="${_pkgname}"
pkgver=0.3
pkgrel=2
pkgdesc="Virtual printer for cups which prints to a file and opens that with a programme the user can choose in the settings. For example, print to gimp."
arch=('any')
depends=(
  'bash'
  'cups'
  'mariadb' # For the 'replace'-executable.
)
install=cups-programme.install
url="http://felics.kettenbruch.de/software/cups-print-to-programme/"
license=('GPL-3.0-or-later')
source=(
  "cups-programme.sh"
  "cups-programme.conf"
  "README.md"
  "TODO.txt"
  "GPL3.txt"
  "${install}"
)
optdepends=(
  "ghostscript: To convert to PDF (also needed for SVG)."
  "pdf2svg: To convert to SVG."
  "imagemagick: To convert to PNG, TIFF, GIF or JPEG."
  "graphicsmagick: To convert to PNG, TIFF, GIF or JPEG."
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
sha256sums=('cef16938a15385e10c8b9d6a1294dedf78004845452dfebd3fedbfffa25f9518'
            'f583ed8969deef9e890b20c475bc24fd4eed8ef3c3a51544f9183fcc69d38c5c'
            '3f62486a89f586f9e706107f573283c6b19e236ccd19991fb6a6b482b090fd73'
            '83b54a69c67d39d03b1b02a4da1c2bccb45c459f239809568221844c2e7500a7'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '0ee996783ae6848cf3c522de135646cb4b19670a48d6f1bf387b5b304f5506ad')



pkgver() {
  cd "${srcdir}"
  ./cups-programme.sh --version
}


package() {
  cd "${srcdir}"
  
  _backend_name="$(./cups-programme.sh | awk '{print $2}')"
  install -v -m 755 -D "cups-programme.sh"   "${pkgdir}/usr/lib/cups/backend/${_backend_name}"
  
  install -v -m 644 -D "cups-programme.conf" "${pkgdir}/etc/cups/cups-programme.conf"
  
  install -v -m 644 -D "README.md"           "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -v -m 644 -D "TODO.txt"            "${pkgdir}/usr/share/doc/${_pkgname}/TODO.txt"
  
  install -v -m 644 -D "GPL3.txt"            "${pkgdir}/usr/share/licenses/${pkgname}/GPL3.txt"
}
