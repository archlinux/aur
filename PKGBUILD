# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=ucsc-kent-genome-tools
pkgver=327
pkgrel=1
pkgdesc="UCSC genome browser 'kent' bioinformatic utilities"
arch=('i686' 'x86_64')
url="http://hgdownload.soe.ucsc.edu/admin/exe/"
license=other
install=$pkgname.install
depends=('mariadb-clients' 'libpng' 'openssl')
source=(http://hgdownload.soe.ucsc.edu/admin/exe/userApps.v${pkgver}.src.tgz .hg.conf)
sha1sums=('0294bf61a0ac8c0d57d1e354ad3eb17187cdecb9'
          'ffc9a7064a697476639c46e9280e0b43ac2393b3')

prepare() {
  cd "${srcdir}/userApps/"
  make clean
}

build() {
   cd "${srcdir}/userApps/"
   make all
}

package() {
   cd "${srcdir}/userApps/"
   mkdir -p "${pkgdir}/usr/bin/"
   mv bin/ "${pkgdir}/usr/bin/kentUtils/"

   mkdir -p "$pkgdir/etc/profile.d"
   echo 'export PATH=/usr/bin/kentUtils:$PATH' > "$pkgdir/etc/profile.d/kentUtils.sh"

   mkdir -p "${pkgdir}/opt/kentUtils/"
   
   cp "${srcdir}/.hd.conf" "${pkgdir}/opt/kentUtils/."
   
   install -D -m644 licenseUcscGenomeBrowser.txt "${pkgdir}/usr/share/licenses/kentUtils/licenseUcscGenomeBrowser.txt"
   install -D -m644 GenomeBrowserLicense.pdf "${pkgdir}/usr/share/licenses/kentUtils/GenomeBrowserLicense.pdf"
   install -D -m644 licenseBlat.txt "${pkgdir}/usr/share/licenses/kentUtils/licenseBlat.txt"
}

# vim:set ts=2 sw=2 et:
