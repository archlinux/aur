# Maintainer: Jameson Pugh <imntreal@gmail.com>
 
pkgname=onedrive
pkgver=1.1
pkgrel=1
pkgdesc="Free OneDrive client written in D"
arch=('i686' 'x86_64')
url="https://github.com/skilion/onedrive"
license=('GPL3')
depends=('curl' 'sqlite')
makedepends=('dmd')
conflicts=('onedrive-git')
source=("https://github.com/skilion/onedrive/archive/v${pkgver}.tar.gz"
        'service.patch')
sha256sums=('c54fad2b452a6a84e009f8743efecdaaca37abcbfe046fc830d7e101cac3594d'
            'f53855c60d23a73119eba2b915b2504f1249a8ab0af179a0ef67a18b5cc46ad9')
 
prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  patch -p0 < ../service.patch
}
build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make
}
 
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -dm 755 "${pkgdir}/usr/bin"
  install -dm 755 "${pkgdir}/etc"
  install -dm 755 "${pkgdir}/usr/lib/systemd/system"
  install -m 755 onedrive "${pkgdir}/usr/bin/"
  install -m 644 onedrive.conf "${pkgdir}/etc/"
  install -m 644 onedrive.service "${pkgdir}/usr/lib/systemd/system/"
}
 
# vim:set ts=2 sw=2 et:
