# Maintainer: David Parrish <daveparrish@tutanota.com>

# shellcheck disable=SC2034,SC2164

_pkgname=losslesscut
pkgname=losslesscut-bin
pkgver=3.53.0
pkgrel=1
pkgdesc="Crossplatform GUI tool for lossless trimming/cutting of video/audio files"
arch=('x86_64')
url="https://github.com/mifi/lossless-cut"
license=('MIT')
depends=('nss' 'ffmpeg' 'gtk3' 'libxss')
source_x86_64=("$pkgname-$pkgver.tar.bz2::https://github.com/mifi/lossless-cut/releases/download/v$pkgver/LosslessCut-linux-x64.tar.bz2"
               "losslesscut.desktop"
               "LICENSE"
               "https://raw.githubusercontent.com/mifi/lossless-cut/master/src/icon.svg")
sha256sums_x86_64=('10f9d21690d9684802b973cccbbf364745e451c6c6fb03546ff2ff7bc94508ee'
                   '87827ee65955d49c40327ba958b15d054cc107cf8e56de7cf1f93d4bc2b6fca5'
                   '48affed7162fc2e76f1cd47b50355181b869b4025ff04c2a53b03854e329dca0'
                   'd3d3da3f403ce1b9f846ae2a38a8fe9938fc458024352a9741b59a920eefacf9')

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
