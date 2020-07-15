# Contributor: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>
# Contributor: dryes <joswiseman@cock.li>

epoch=1
pkgname='wav2png-git'
_pkgname='wav2png'
pkgver=0.4.r0.g80e277e
pkgrel=1
pkgdesc='Creates waveform pngs out of audio files.'
url='https://github.com/beschulz/wav2png'
arch=('i686' 'x86_64')
license=('GPL2')
provides=('wav2png')
depends=('libsndfile' 'libpng' 'boost-libs')
makedepends=('git' 'png++' 'boost')
optdepends=('sox')
source=('git+https://github.com/beschulz/wav2png.git')
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  [ -d "${srcdir}/${_pkgname}-build" ] && rm -rf "${srcdir}/${_pkgname}-build"
  cp -r "${srcdir}/${_pkgname}" "${srcdir}/${_pkgname}-build"
}

package() {
  cd "${srcdir}/${_pkgname}-build/build"
  make all

  mkdir -p "${pkgdir}/usr/bin"
  mv "${srcdir}/${_pkgname}-build/bin/Linux/wav2png" "${pkgdir}/usr/bin/"
}
