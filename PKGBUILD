# Maintainer: dryes <joswiseman@cock.li>
pkgname='wav2png-git'
pkgver=98
pkgrel=1
pkgdesc='Creates waveform pngs out of audio files.'
url='https://github.com/beschulz/wav2png'
arch=('i686' 'x86_64')
license=('GPL2')
provides=('wav2png')
depends=('libsndfile' 'libpng' 'libpng12' 'png++')
makedepends=('git')
optdepends=('sox')
source=('git://github.com/beschulz/wav2png.git')
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  echo $(git rev-list --count master)
}

build() {
  [ -d "${srcdir}/${pkgname%-git}-build" ] && rm -rf "${srcdir}/${pkgname%-git}-build"
  cp -r "${srcdir}/${pkgname%-git}" "${srcdir}/${pkgname%-git}-build"
}

package() {
  cd "${srcdir}/${pkgname%-git}-build/build"
  make all

  mkdir -p "${pkgdir}/usr/bin"
  mv "${srcdir}/${pkgname%-git}-build/bin/Linux/wav2png" "${pkgdir}/usr/bin/"
}
