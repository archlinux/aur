pkgname=dosierskanilo-gui-git
pkgver=0
pkgrel=1
pkgdesc='Development version of the DosierSkanilo GTK frontend'
arch=('x86_64')
url='https://gitlab.vahanus.net/dlang/dosierskanilo-gui'
license=('custom:CC-BY-NC-SA-4.0')
depends=('gtk3' 'gstreamer' 'dosierskanilo')
makedepends=('ldc' 'dub' 'git')
provides=('dosierskanilo-gui')
conflicts=('dosierskanilo-gui')
source=('git+https://gitlab.vahanus.net/dlang/dosierskanilo-gui.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/dosierskanilo-gui"
  printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/dosierskanilo-gui"
  DC=ldc2 dub build --build=release --compiler=ldc2
}

package() {
  cd "$srcdir/dosierskanilo-gui"
  install -Dm755 build/bin/dosierskanilo-gui "$pkgdir/usr/bin/dosierskanilo-gui"
}
