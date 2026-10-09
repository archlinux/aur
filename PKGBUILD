# Maintainer: Mujtaba1i
# pkgver is rewritten from the git tag by .github/workflows/release.yml.
# Needs the release tarball layout introduced alongside this file
# (binary + LICENSE + .desktop + icons), i.e. releases after v0.2.2.

pkgname=archtoys-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="System-wide color picker for Linux, inspired by PowerToys (precompiled binary)"
arch=('x86_64')
url="https://github.com/Mujtaba1i/Archtoys"
license=('MIT')
depends=('gcc-libs' 'glibc' 'fontconfig' 'libx11' 'libxcb' 'libxcursor' 'libxi'
         'libxkbcommon' 'libxkbcommon-x11' 'libglvnd' 'wayland' 'hicolor-icon-theme')
provides=("archtoys=${pkgver}")
conflicts=('archtoys')
options=('!debug')
source=("archtoys-linux-x86_64-v${pkgver}.tar.gz::https://github.com/Mujtaba1i/Archtoys/releases/download/v${pkgver}/archtoys-linux-x86_64.tar.gz")
sha256sums=('5bfe2d24ff5418603ab3dac8196ec0ff413e5c40e2bf3f16236d129827dced76')

package() {
  cd "${srcdir}"

  install -Dm755 archtoys "${pkgdir}/usr/bin/archtoys"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 colornames-LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/colornames-LICENSE.txt"
  install -Dm644 archtoys.desktop "${pkgdir}/usr/share/applications/archtoys.desktop"

  for size in 16 22 24 32 48 64 128 256 512; do
    install -Dm644 "archtoys-${size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/archtoys.png"
  done
  # archtoys.png is the 1024x1024 master icon
  install -Dm644 archtoys.png "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/archtoys.png"
}
