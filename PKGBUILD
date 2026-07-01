# Maintainer: kylon
pkgbase="openwincontrolscli-git"
pkgname="$pkgbase"
pkgdesc="Open source GPD WinControls replacement (command-line)"
pkgver=1.0.66ad59a
_version=1.0
pkgrel=2
provides=("$pkgbase")
conflicts=("$pkgbase")
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
  printf "%s.%s" "${_version}" "$(git rev-parse --short=7 HEAD)"
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
