# Contributor: Baptiste Jonglez <archlinux@bitsofnetworks.org>
# Maintainer:  Tjaart van der Walt <archlinux@tjaart.co.za>

pkgname=fgallery
pkgver=1.8.2
pkgrel=3
arch=('any')
pkgdesc='a modern, minimalist javascript photo gallery'
url='https://www.thregr.org/~wavexx/software/fgallery/'
license=('GPL2')
depends=('fbida' 'imagemagick' 'lcms' 'perl>=5.14' 'perl-json' 'perl-image-exiftool' 'zip')
optdepends=('facedetect-git: to center thumbnails on subject face'
    'jpegoptim: to optimize JPEG files'
    'p7zip: for faster compression'
    'pngcrush: to optimize PNG files'
    'python-pyqt4: to use fcaption')
source=("https://github.com/wavexx/fgallery/archive/fgallery-${pkgver}.tar.gz")
sha256sums=('3c9f558b97db57d66ad26885d9fb0738a771d775a40648df6afa4d212dd35750')

package() {
  cd "${pkgname}-${pkgname}-${pkgver}"

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

  # Man page
  install -Dm 644 "fgallery.1" "${pkgdir}/usr/share/man/man1/fgallery.1"
}
