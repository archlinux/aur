# Maintainer: David Parrish <daveparrish@tutanota.com>

# shellcheck disable=SC2034,SC2164

_pkgname=losslesscut
pkgname=losslesscut-bin
pkgver=3.70.2
pkgrel=1
pkgdesc="Crossplatform GUI tool for lossless trimming/cutting of video/audio files"
arch=('x86_64' 'aarch64')
url="https://github.com/mifi/lossless-cut"
license=('MIT')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
depends=('nss' 'ffmpeg' 'gtk3' 'libxss')
source_x86_64=("LosslessCut-$pkgver-linux-x64.tar.bz2::https://github.com/mifi/lossless-cut/releases/download/v$pkgver/LosslessCut-linux-x64.tar.bz2"
               "losslesscut.desktop"
               "LICENSE"
               "https://raw.githubusercontent.com/mifi/lossless-cut/refs/heads/master/src/renderer/src/icon.svg")
source_aarch64=("LosslessCut-$pkgver-linux-arm64.tar.bz2::https://github.com/mifi/lossless-cut/releases/download/v$pkgver/LosslessCut-linux-arm64.tar.bz2"
               "losslesscut.desktop"
               "LICENSE"
               "https://raw.githubusercontent.com/mifi/lossless-cut/refs/heads/master/src/renderer/src/icon.svg")
sha256sums_x86_64=('6a5d36f92197a9c2af5cb9ff02d6bb5256ebec935950733f31a8ad02b47a2286'
                   '6e14f887657ff23521cf413685ad4ac528656d8d3227c0380f5c71c30ed6ed64'
                   '48affed7162fc2e76f1cd47b50355181b869b4025ff04c2a53b03854e329dca0'
                   'd3d3da3f403ce1b9f846ae2a38a8fe9938fc458024352a9741b59a920eefacf9')
sha256sums_aarch64=('309d551110e04c81c7eaecd93af55165cfb6118b0d5caa705f9f09ff9d00e970'
                    '6e14f887657ff23521cf413685ad4ac528656d8d3227c0380f5c71c30ed6ed64'
                    '48affed7162fc2e76f1cd47b50355181b869b4025ff04c2a53b03854e329dca0'
                    'd3d3da3f403ce1b9f846ae2a38a8fe9938fc458024352a9741b59a920eefacf9')

package() {
  case "$CARCH" in
    aarch64) _pkgarch="arm64"
      ;;
    x86_64) _pkgarch="x64"
      ;;
  esac

  cd "${srcdir:?}"
  mkdir -p "${pkgdir:?}"/usr/{share/losslesscut,bin}
  cd LosslessCut-linux-$_pkgarch
  tar -cf - . | tar -C "$pkgdir/usr/share/losslesscut" -xvf -
  ln -s /usr/share/losslesscut/losslesscut "$pkgdir"/usr/bin/losslesscut
  install -Dm644 ../losslesscut.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -Dm644 ../icon.svg "$pkgdir"/usr/share/pixmaps/$_pkgname.svg
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
