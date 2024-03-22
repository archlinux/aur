# Maintainer: David Parrish <daveparrish@tutanota.com>

# shellcheck disable=SC2034,SC2164

_pkgname=losslesscut
pkgname=losslesscut-bin
pkgver=3.59.1
pkgrel=3
pkgdesc="Crossplatform GUI tool for lossless trimming/cutting of video/audio files"
arch=('x86_64')
url="https://github.com/mifi/lossless-cut"
license=('MIT')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
depends=('nss' 'ffmpeg' 'gtk3' 'libxss')
source_x86_64=("$pkgname-$pkgver.tar.bz2::https://github.com/mifi/lossless-cut/releases/download/v$pkgver/LosslessCut-linux-x64.tar.bz2"
               "losslesscut.desktop"
               "LICENSE"
               "https://github.com/mifi/lossless-cut/blob/26b4dc13c2c42b88dda6bf0eafd47b17e47f1bed/src/renderer/src/icon.svg")
sha256sums_x86_64=('d5afd69162ac81c6c89aebd35a001fc435571dcb1027024a8f069569b65a377c'
                   '87827ee65955d49c40327ba958b15d054cc107cf8e56de7cf1f93d4bc2b6fca5'
                   '48affed7162fc2e76f1cd47b50355181b869b4025ff04c2a53b03854e329dca0'
                   '7a60a86e81bab230280cef7195e7736a8060e4b1f3b54e40f766ac3093dbd902')

package() {
  cd "${srcdir:?}"
  mkdir -p "${pkgdir:?}"/usr/{share/losslesscut,bin}
  cd LosslessCut-linux-x64
  tar -cf - . | tar -C "$pkgdir/usr/share/losslesscut" -xvf -
  ln -s /usr/share/losslesscut/losslesscut "$pkgdir"/usr/bin/losslesscut
  install -Dm644 ../losslesscut.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -Dm644 ../icon.svg "$pkgdir"/usr/share/pixmaps/$_pkgname.svg
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
