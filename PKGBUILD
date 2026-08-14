pkgname=raddebugger-git
pkgver=0.9.28.r4493.g08d25fa3
pkgrel=1
pkgdesc='Native graphical debugger for x86-64 Windows and Linux'
arch=('x86_64')
url='https://github.com/EpicGames/raddebugger'
license=('MIT')
depends=('freetype2' 'libx11' 'libxext' 'mesa')
makedepends=('git' 'clang' 'pkgconf')
source=('git+https://github.com/EpicGames/raddebugger.git')
sha256sums=('SKIP')

pkgver() {
  cd raddebugger
  printf '0.9.28.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd raddebugger
  ./build.sh raddbg raddbg_non_graphical radbin radlink
}

package() {
  cd raddebugger
  install -Dm755 build/raddbg "$pkgdir/usr/bin/raddbg"
  install -Dm755 build/raddbg_non_graphical "$pkgdir/usr/bin/raddbg_non_graphical"
  install -Dm755 build/radbin "$pkgdir/usr/bin/radbin"
  install -Dm755 build/radlink "$pkgdir/usr/bin/radlink"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
