# Maintainer: Codigo Cristo <tu-email@example.com>

pkgname=gimp-plugin-text-case-converter
_pluginname=text-case-converter
_gitauthor=CodigoCristo
_gitbranch=main
pkgver=0.1
pkgrel=1
pkgdesc="GIMP 3.x plugin to convert text layer case (uppercase, lowercase, title case, etc.)"
license=('GPL-3.0-or-later')
arch=('any')
url="https://github.com/$_gitauthor/$pkgname"
depends=('gimp>=3.0' 'python')
makedepends=('git')
install="$pkgname.install"
source=("git+https://github.com/$_gitauthor/$pkgname.git#branch=$_gitbranch")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  # Directorio de plugins de GIMP 3.x en el sistema (Arch Linux)
  local _plugindir="$pkgdir/usr/lib/gimp/3.0/plug-ins/$_pluginname"

  install -dm755 "$_plugindir"
  install -Dm755 "$srcdir/$pkgname/$_pluginname/$_pluginname.py" \
    "$_plugindir/$_pluginname.py"
}
