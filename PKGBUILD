# Maintainer: Capezotte ( base32 -d <<<'NVXWGLTMNFQW2Z2AHE4TAMTBNZQXEYLDBI======' | rev )
# Contributor: Jake <aur@ja-ke.tech>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Chris Giles <Chris.G.27 (at) Gmail.com>

pkgname=q4wine
pkgver=1.4.2
pkgrel=1
pkgdesc="a Qt GUI for W.I.N.E."
arch=("x86_64")
url="https://q4wine.brezblock.org.ua/"
license=("GPL-3.0-only")
depends=("qt6-base" "gcc-libs" "glibc" "icoutils" "fuseiso")
makedepends=("cmake" "qt6-tools" "qt6-svg" "vulkan-headers")
source=("$pkgname-$pkgver.tar.gz::https://github.com/brezerk/q4wine/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e27d32c09e53c36cdd6ab9e9a2587f1d5a8800b3efab8784ead3e1713c8cbfd9')

build() {
  cmake -B build -S "$pkgname-$pkgver" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIBS_ENTRY_PATH=/usr/lib/$pkgname \
    -DUSE_GZIP=ON
  cmake --build build
}

package() {
  depends+=("coreutils" "util-linux" "tar" "sh" "wine"
            "wget" "which" "hicolor-icon-theme")
  optdepends=("sudo: Mount iso image with sudo"
              "polkit: Mount iso image with gui_sudo"
              "konsole: The most prefered terminal app"
              "gnome-terminal: The second prefered terminal app"
              "xterm: The last prefered terminal app")
  DESTDIR="$pkgdir" cmake --install build
}
