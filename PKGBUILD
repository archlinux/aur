# Maintainer: Pedro Henrique Quitete Barreto <pedrohqb@gmail.com>
# Contributor: Geyslan G. Bem <geyslan@gmail.com>
# Contributor: Denis A. Altoé Falqueto <denisfalqueto@gmail.com>
pkgname=safesignidentityclient
pkgver=4.0.0.0
pkgrel=3
pkgdesc="Smart card PKCS#11 provider and token manager"
arch=('x86_64')
url="https://certificaat.kpn.com/installatie-en-gebruik/installatie/pas-usb-stick/linux/"
license=('custom:copyright')
conflicts=('safesign-lib')
options=(!debug)
depends=('gcc-libs' 'glib2' 'glibc' 'hicolor-icon-theme' 'pcsclite' 'libsm' 'libx11' 'cairo' 'pango'
         'gdk-pixbuf2' 'at-spi2-core' 'gtk3' 'libxxf86vm' 'openssl-1.1' 'gdbm')
optdepends=('ccid: Generic support for CCID devices',
            'acsccid: ACS CCID PC/SC driver',
            'scmccid: binary driver for the SCM Smart Card Readers')
source_x86_64=("https://certificaat.kpn.com/files/drivers/SafeSign/SafeSign%20IC%20Standard%20Linux%204.0.0.0-AET.000%20redhat9%20x86_64.rpm" "https://certificaat.kpn.com/files/drivers/SafeSign/SafeSign%20IC%20Standard%20Linux%204.0.0.0-AET.000%20ub2204%20x86_64.deb")
sha256sums_x86_64=('638d6e21b3d7155ca9c624c288b31ca7c6132811f740d0eb2edef8a725e48df0' '2fc29e0e5dfc3e62d36ae49f3225c721ce9a7762eca3765fb32742bc17226df8')
noextract=('SafeSign%20IC%20Standard%20Linux%204.0.0.0-AET.000%20ub2204%20x86_64.deb')

# preparing the package to use the Ubuntu libraries as they are compatible with Arch

prepare() {
  ar x SafeSign%20IC%20Standard%20Linux%204.0.0.0-AET.000%20ub2204%20x86_64.deb
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
