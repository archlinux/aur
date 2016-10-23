# Contributor: Matthieu Rakotojaona <matthieu.rakotojaona@gmail.com>
# Maintainer: Matthieu Rakotojaona <matthieu.rakotojaona@gmail.com>

pkgname=facedetect-git
pkgver=r30.cfb2af1
pkgrel=1
arch=('any')
pkgdesc='a simple face detector for batch processing, used by fgallery'
url='https://www.thregr.org/~wavexx/software/facedetect/'
license=('GPL2')
depends=('opencv' 'python2' 'python2-numpy')
source=("$pkgname::git+https://github.com/wavexx/facedetect")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  # facedetect is written in python2 style
  cd "${pkgname}"
  sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|' facedetect
}

package() {
  cd "${pkgname}"

  # Binaries
  install -d "${pkgdir}/usr/bin"
  install -m755 "facedetect" "${pkgdir}/usr/bin"
}
