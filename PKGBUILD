pkgname=astap
pkgver=2026.07.16
pkgrel=1
pkgdesc="Astrometric (plate) solver, stacking of images, photometry and FITS viewer (build from source). Qt5 version."
arch=('x86_64')
url="http://www.hnsky.org/astap.htm"
license=('GPL')
makedepends=('lazarus')
depends=('qt5-base' 'qt5-x11extras' 'qt5pas')
source=("https://www.hnsky.org/astap_source.zip")
sha256sums=('0eaff0fa1a265d3c0d56b5fe205537dd8c1d0a02610a4b0000ef2935923c87aa')
optdepends=('hyperleda-galaxy-db-astap: 25MB database of 1.3m galaxies and 171k other non-star objects'
  'w08-star-db-astap: 250KB database of stars up to magnitude 8, reliable above 20° FOV'
  'd05-star-db-astap: 100MB database of 500 stars per square degree, reliable with 0.6-10° FOV'
  'd20-star-db-astap: 400MB database of 2000 stars per square degree, reliable with 0.3-10° FOV'
  'd50-star-db-astap: 900MB database of 5000 stars per square degree, reliable with 0.2-10° FOV'
  'd80-star-db-astap: 1.2GB database of 8000 stars per square degree, reliable with 0.15-10° FOV'
)
conflicts=('astap-bin' 'astap-bin-qt5' 'astap-cli')

build() {
  cd $srcdir/
  lazbuild -B --lazarusdir=/usr/lib/lazarus astap_linux_qt5.lpi
}

package() {
  mkdir -p "${pkgdir}/opt/${pkgname}"
  cp -r "${srcdir}/${pkgname}" "${pkgdir}/opt/${pkgname}/${pkgname}"
  mkdir -p "${pkgdir}/usr/bin"
  ln -sr "${pkgdir}/opt/astap/astap" "${pkgdir}/usr/bin/astap"
}
