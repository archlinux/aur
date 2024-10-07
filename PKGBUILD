# Maintainer: Forest Crossman <cyrozap at gmail dot com>

pkgname=digilent.adept.runtime
pkgver=2.27.9
pkgrel=1
pkgdesc="The Adept Runtime consists of the shared libraries, firmware images, and configuration files necessary to communicate with Digilent's devices."
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://reference.digilentinc.com/reference/software/adept/start"
license=('custom')
depends=('libusb')
options=('!strip')
backup=('etc/digilent-adept.conf' 'etc/ld.so.conf.d/digilent-adept-libraries.conf' 'etc/udev/rules.d/52-digilent-usb.rules')
source_aarch64=("https://files.digilent.com/Software/Adept2%20Runtime/${pkgver}/${pkgname}_${pkgver}-arm64.deb")
source_armv6h=("https://files.digilent.com/Software/Adept2%20Runtime/${pkgver}/${pkgname}_${pkgver}-armhf.deb")
source_armv7h=($source_armv6h)
source_i686=("https://files.digilent.com/Software/Adept2%20Runtime/${pkgver}/${pkgname}_${pkgver}-i386.deb")
source_x86_64=("https://files.digilent.com/Software/Adept2%20Runtime/${pkgver}/${pkgname}_${pkgver}-amd64.deb")
sha256sums_aarch64=('264798458c8e1f93521e77565163b8220ef07969db9a19c46bd40f1d89cf29e9')
sha256sums_armv6h=('ccab8ae6731c5a66c7fc23d3035a6f2fa374c3368e226e3f048f74b0f1006f2f')
sha256sums_armv7h=($sha256sums_armv6h)
sha256sums_i686=('984c9d2601c9bdefb32e3aa30f1b187dcbd9cd51e679255156c7e7fbd880e454')
sha256sums_x86_64=('c8a2ccf2d9ea1ffa0f3a4ae4ed2ff690a0687ff83382b62dae30fa13198bbf53')

package() {
  # Extract
  tar -xJf data.tar.xz --exclude="usr/share/lintian" -C "${pkgdir}"/

  # Correct paths
  [ -d "${pkgdir}"/usr/lib64 ] && mv "${pkgdir}"/usr/{lib64,lib}
  [ -d "${pkgdir}"/usr/sbin ] && mv "${pkgdir}"/usr/{sbin,bin}

  # License files
  install -dm 755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/copyright"
  ln -s "/usr/share/doc/${pkgname}/EULA" "${pkgdir}/usr/share/licenses/${pkgname}/EULA"
}
