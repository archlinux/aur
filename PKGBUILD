# Maintainer: Forest Crossman <cyrozap at gmail dot com>

pkgname=digilent.adept.runtime
pkgver=2.16.1
pkgrel=1
pkgdesc="The Adept Runtime consists of the shared libraries, firmware images, and configuration files necessary to communicate with Digilent's devices."
arch=('i686' 'x86_64')
url="https://www.digilentinc.com/Products/Detail.cfm?NavPath=2,66,828&Prod=ADEPT2"
license=('custom')
depends=('libusb')
conflicts=('libftd2xx')
options=('!strip')
backup=('etc/digilent-adept.conf' 'etc/ld.so.conf.d/digilent-adept-libraries.conf' 'etc/udev/rules.d/52-digilent-usb.rules')

if [[ $CARCH == 'i686' ]]; then
  source=("${pkgname}_${pkgver}_i386.deb::http://www.digilentinc.com/Data/Products/ADEPT2/${pkgname}_${pkgver}_i386.deb")
  sha1sums=('42d939af49701ffefc229720d45c47be7d1e1860')
elif [[ $CARCH == 'x86_64' ]]; then
  source=("${pkgname}_${pkgver}_amd64.deb::http://www.digilentinc.com/Data/Products/ADEPT2/${pkgname}_${pkgver}_amd64.deb")
  sha1sums=('34968e47627b8f5dc3d92bcfb9e49e601c6fcfa1')
fi

package() {
  # Extract
  tar -xzf data.tar.gz --exclude="usr/share/lintian" -C "${pkgdir}"/

  # Correct paths
  [ -d "${pkgdir}"/usr/lib64 ] && mv "${pkgdir}"/usr/{lib64,lib}
  [ -d "${pkgdir}"/usr/sbin ] && mv "${pkgdir}"/usr/{sbin,bin}

  # License files
  install -dm 755 "${pkgdir}"/usr/share/licenses/digilent.adept.runtime
  ln -s /usr/share/doc/digilent.adept.runtime/copyright "${pkgdir}"/usr/share/licenses/digilent.adept.runtime/copyright
  ln -s /usr/share/doc/digilent.adept.runtime/EULA "${pkgdir}"/usr/share/licenses/digilent.adept.runtime/EULA
}
