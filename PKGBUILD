# Contributor: Baptiste Jonglez <archlinux@bitsofnetworks.org>
# Maintainer:  Tjaart van der Walt <archlinux@tjaart.co.za>

pkgname=fgallery
pkgver=1.9.1
pkgrel=2
arch=('any')
pkgdesc='a modern, minimalist javascript photo gallery'
url='https://www.thregr.org/~wavexx/software/fgallery/'
license=('GPL2')
depends=('fbida' 'imagemagick' 'lcms2' 'perl>=5.14' 'perl-image-exiftool' 'zip')
optdepends=('7-zip: for faster and higher-compression zip archiving'
    'facedetect-git: for face detection'
    'jpegoptim: for JPEG size optimization'
    'pngcrush: for PNG size optimization'
    'python-pyqt6: for use with fcaption'
    'libcpanel-json-xs-perl'
  )
source=("https://www.thregr.org/~wavexx/software/fgallery/releases/fgallery-${pkgver}.zip")
sha256sums=('16f174c2445edf04cf506f7f18407191ac6f675078c0477d908f6b5111cac67d')

package() {
  cd "${pkgname}-${pkgver}"

  # Data files
  install -d "${pkgdir}/usr/share/fgallery"
  cp -r view/ "${pkgdir}/usr/share/fgallery/"

  # Binaries
  install -m755 "fgallery" "${pkgdir}/usr/share/fgallery/fgallery"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/fgallery/fgallery" "${pkgdir}/usr/bin/fgallery"
  install -m755 "utils/fcaption" "${pkgdir}/usr/bin/fcaption"

  # Desktop file
  install -Dm644 "utils/fcaption.desktop" "${pkgdir}/usr/share/applications/fcaption.desktop"

  # # Man page
  install -Dm 644 "fgallery.1" "${pkgdir}/usr/share/man/man1/fgallery.1"
}
