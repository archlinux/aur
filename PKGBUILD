# Maintainer: Borys Kharchenko (https://github.com/arximus88)
# Prebuilt release (tar.gz built by tools/package.sh tar in the upstream repository).
pkgname=slicenv-bin
pkgver=0.1.1
pkgrel=1
pkgdesc='Fast native 3D printing slicer front-end for OrcaSlicer and Bambu Studio engines'
arch=('x86_64')
url='https://github.com/arximus88/slicenv'
license=('AGPL-3.0-or-later')
depends=('libgcc' 'libstdc++' 'glibc' 'libxkbcommon' 'libxkbcommon-x11' 'libxcb' 'wayland'
         'vulkan-icd-loader' 'hicolor-icon-theme' 'python' 'curl' 'tar' 'xdg-utils')
optdepends=('squashfs-tools: faster unpacking of AppImage slicer engines'
            'vulkan-driver: GPU rendering (mesa, nvidia-utils, ...)')
provides=('slicenv')
conflicts=('slicenv' 'slicenv-git')
options=('!strip' '!debug')
source_x86_64=("https://github.com/arximus88/slicenv/releases/download/v${pkgver}/slicenv-${pkgver}-${CARCH}-linux.tar.gz")
sha256sums_x86_64=('590941045eb54788b87ca1a02363b02d0d299d4a54774e531f85c67eecc785d5')

package() {
  cd "slicenv-${pkgver}-${CARCH}-linux"
  cp -a usr "$pkgdir/"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  mv "$pkgdir/usr/share/doc/slicenv/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  for f in THIRD-PARTY-NOTICES.md THIRD-PARTY-RUST-CRATES.md THIRD-PARTY-LICENSES.txt; do
    ln -s "/usr/share/doc/slicenv/$f" "$pkgdir/usr/share/licenses/$pkgname/$f"
  done
}
