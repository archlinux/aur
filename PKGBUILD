# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Thomas Roos (Roosted7) <mail [at] thomasroos [dot] nl>

pkgname=aliza
pkgver=2.8.3.1
pkgrel=1
pkgdesc="Medical imaging viewer for 2D, 3D and 4D images in DICOM, MetaIO, Nifti, Nrrd and other formats (30-day free trial, then paid license required)"
arch=('x86_64')
url="https://www.aliza-medical-imaging.de"
license=('LicenseRef-aliza')
depends=('libgcc'
         'libstdc++'
         'glibc'
         'hicolor-icon-theme'
         'libglvnd'
         'libx11'
         'libxt'
         'qt5-base'
         'qt5-svg'
         'zlib')
options=('!emptydirs')
install=aliza.install
source=("https://www.aliza-medical-imaging.de/aliza_${pkgver}_amd64.deb"
        "aliza.sh")
sha512sums=('09402f8ae810144b8264852fa02d9b6ff3a7050a84cf2f8b8c5bbf976c974c1d8b37143390e4b2e7676bcd604706d4e366b3478a273b8b3592c27b97dccc7932'
            'bd59a261a68422ffaabd30d40aa12da46fb1faf4a48f63e5524b8d61276c036e64cbefc1d3e184d10aae87ff2cbbd7a4d51ebce9c3bcb3244d6712704ee3d1b0')

package() {
  bsdtar -xf data.tar.xz -C "${pkgdir}" --exclude './usr/share/lintian'
  install -Dm644 "${pkgdir}/usr/share/doc/${pkgname}/copyright" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -d "${pkgdir}/usr/lib/${pkgname}"
  mv "${pkgdir}"/usr/bin/{aliza,aliza-vtkvol} "${pkgdir}/usr/lib/${pkgname}/"
  install -Dm755 "${srcdir}/aliza.sh" "${pkgdir}/usr/bin/aliza"
  ln -s "/usr/lib/${pkgname}/aliza-vtkvol" "${pkgdir}/usr/bin/aliza-vtkvol"
}
