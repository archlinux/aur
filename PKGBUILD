# Maintainer: kylon
pkgbase="openwincontrolscli-git"
pkgname="$pkgbase"
pkgdesc="Open source GPD WinControls replacement (command-line)"
pkgver=1.0
pkgrel=3
provides=("openwincontrolscli")
conflicts=("openwincontrolscli")
url="https://github.com/OpenWinControls/OpenWinControlsCLI"
arch=("x86_64")
license=("GPL-3.0-or-later")
optdepends=("openwincontrols-rules: rules to allow non-root access")
makedepends=("git" "cmake")
install="owc.install"
source=("git+https://github.com/OpenWinControls/OpenWinControlsCLI.git")
sha256sums=("SKIP")

pkgver() {
  cd "$srcdir/OpenWinControlsCLI"
  git describe --long --tags | sed -e 's/-\([^-]*-g[^-]*\)$/-r\1/' -e 's/-/./g'
}

build() {
  cd "$srcdir/OpenWinControlsCLI"
  git submodule update --init --recursive
  cmake -B build -S . -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  install -Dm755 "$srcdir/OpenWinControlsCLI/build/OpenWinControlsCLI" "$pkgdir/usr/bin/OpenWinControlsCLI"
}
