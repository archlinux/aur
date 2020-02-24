# Maintainer: David Parrish <daveparrish@tutanota.com>

# shellcheck disable=SC2034,SC2164

pkgname=losslesscut
pkgver=3.8.0
pkgrel=1
pkgdesc="Crossplatform GUI tool for lossless trimming/cutting of video/audio files"
arch=('x86_64')
url="https://github.com/mifi/lossless-cut"
license=('MIT')
depends=('nss' 'ffmpeg' 'gtk3')
makedepends=('asar')
source_x86_64=("https://github.com/mifi/lossless-cut/releases/download/v$pkgver/LosslessCut-linux.tar.bz2"
               "losslesscut.desktop"
               "LICENSE")
sha256sums_x86_64=('3eca17b7f405b514bed928882429a2656dfc987f1001b2962401985633f80f5c'
                   'e91017634fe1e3685a6affd8d72c1ec11af4d390c9fc13d503ae67e8c6e4e852'
                   '48affed7162fc2e76f1cd47b50355181b869b4025ff04c2a53b03854e329dca0')

package() {
  cd "${srcdir:?}"
  mkdir -p "${pkgdir:?}"/usr/{share/losslesscut,bin}
  cd LosslessCut-linux
  asar ef resources/app.asar build/icon.svg
  tar -cf - --exclude app.asar.unpacked --exclude icon.svg . | tar -C "$pkgdir/usr/share/losslesscut" -xvf -
  ln -s /usr/share/losslesscut/lossless-cut "$pkgdir"/usr/bin/losslesscut
  install -Dm644 ../$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -Dm644 icon.svg "$pkgdir"/usr/share/pixmaps/$pkgname.svg
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
