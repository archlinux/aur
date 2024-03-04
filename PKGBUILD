# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org>
# Contributor: Polis Minus <polisminus2247@tuta.io>

pkgname=activate-linux-git
pkgver=r320.cf8080e
pkgrel=1
pkgdesc="The 'Activate Windows' watermark ported to Linux with Xlib and cairo in C"
arch=(x86_64)
url="https://github.com/MrGlockenspiel/activate-linux"
license=(GPL3)
depends=(cairo libx11 libxfixes libxinerama libxrandr wayland libxext glibc)
makedepends=(git wayland-protocols)
provides=(activate-linux)
conflicts=(activate-linux)
source=("git+https://github.com/MrGlockenspiel/activate-linux.git"
        activate-linux.desktop)
sha256sums=('SKIP'
            'f1c0aad4d41632002608788cb41e2259de6524b9a2604d6bbcbdd0fb1643af6d')

pkgver() {
  cd "activate-linux"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "activate-linux"
  make
}

package() {
  install -D activate-linux.desktop "$pkgdir/usr/share/applications/activate-linux.desktop"
  cd "activate-linux"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D activate-linux "$pkgdir/usr/bin/activate-linux"
  install -D activate-linux.1 -t "${pkgdir}"/usr/share/man/man1/
}
