# Maintainer: Pedro Henrique Quitete Barreto <pedrohqb@gmail.com>
# Contributor: Geyslan G. Bem <geyslan@gmail.com>
# Contributor: Denis A. Altoé Falqueto <denisfalqueto@gmail.com>
pkgname=safesignidentityclient
pkgver=4.5.0.0
pkgrel=1
pkgdesc="Smart card PKCS#11 provider and token manager"
arch=('x86_64')
url="https://certificaat.kpn.com/installatie-en-gebruik/installatie/pas-usb-stick/linux/"
license=('custom:copyright')
options=(!debug)
depends=('gcc-libs' 'glib2' 'glibc' 'hicolor-icon-theme' 'pcsclite' 'libsm' 'libx11' 'cairo' 'pango'
         'gdk-pixbuf2' 'at-spi2-core' 'gtk3' 'libxxf86vm' 'openssl' 'gdbm')
optdepends=('ccid: Generic support for CCID devices',
            'acsccid: ACS CCID PC/SC driver',
            'scmccid: binary driver for the SCM Smart Card Readers')
source_x86_64=("https://assets.ctfassets.net/zuadwp3l2xby/3b4YS8ts1cuD4BnUoQGZXl/93f644f03cc226b2adab290be11c6cd5/SafeSignICStandardLinux4.5.0.0-AET.000redhat10x86_64.rpm" "https://assets.ctfassets.net/zuadwp3l2xby/6vGICRnQgQ8TkcHTgcouIr/5acf96dcbc0364aa9228606d3969ef97/SafeSignICStandardLinux4.5.0.0-AET.000ub2404x86_64.deb")
sha256sums_x86_64=('2f5ea4622fda213c9bfc8bf4da51dac09983a349326f9275309565dbdb123378' '7742e21e3141e51e307d7613b4046886bc7c4aa203835dcf5c43cd348f2a1b91')
noextract=('SafeSignICStandardLinux4.5.0.0-AET.000ub2404x86_64.deb')

# preparing the package to use the Ubuntu libraries as they are compatible with Arch

prepare() {
  ar x SafeSignICStandardLinux4.5.0.0-AET.000ub2404x86_64.deb
  mkdir safesign-deb
  tar xvf data.tar.zst -C safesign-deb
  rm -rf ${srcdir}/usr/lib64
  mv ${srcdir}/safesign-deb/usr/lib/ ${srcdir}/usr/lib64 
}

package() {
  install -d ${pkgdir}/usr
  cp -R ${srcdir}/usr/{bin,share} ${pkgdir}/usr/

  install -d ${pkgdir}/usr/lib
  cp -R ${srcdir}/usr/lib64/. ${pkgdir}/usr/lib/

  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  install -m 644 ${srcdir}/usr/share/doc/${pkgname}/copyright ${pkgdir}/usr/share/licenses/${pkgname}/copyright
}
