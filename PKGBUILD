# Maintainer: Jameson Pugh <imntreal@gmail.com>
 
pkgname=onedrive-git
pkgver=r99.7d700e1
pkgrel=1
pkgdesc="Free OneDrive client written in D"
arch=('i686' 'x86_64')
url="https://github.com/skilion/onedrive"
license=('GPL3')
depends=('dmd' 'curl' 'sqlite')
provides=('onedrive')
conflicts=('onedrive')
source=("${pkgname}::git+https://github.com/skilion/onedrive.git"
        'service.patch')
sha256sums=('SKIP'
            '1dba1975b660f7f53dff7a2c93cc954251e1aed8d46e6c3464c399b740f7cb5c')
 
pkgver() {
  cd ${pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname}"
  
  patch -p0 < ../service.patch
}
build() {
  cd "${srcdir}/${pkgname}"

  make
}
 
package() {
  cd "${srcdir}/${pkgname}"

  install -dm 755 "${pkgdir}/usr/bin"
  install -dm 755 "${pkgdir}/etc"
  install -dm 755 "${pkgdir}/usr/lib/systemd/system"
  install -m 755 onedrive "${pkgdir}/usr/bin/"
  install -m 644 onedrive.conf "${pkgdir}/etc/"
  install -m 644 onedrive.service "${pkgdir}/usr/lib/systemd/system/"
}
 
# vim:set ts=2 sw=2 et:
