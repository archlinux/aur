# Maintainer: Codigo Cristo <tu-email@example.com>

pkgname=gimp-plugin-text-case-converter
_pluginname=text-case-converter
_gitname=text-case-converter-Gimp
_gitauthor=CodigoCristo
_gitbranch=main
pkgver=0.1
pkgrel=1
pkgdesc="GIMP 3.x plugin to convert text layer case (uppercase, lowercase, title case, etc.)"
license=('GPL-3.0-or-later')
arch=('any')
url="https://github.com/$_gitauthor/$_gitname"
depends=('gimp>=3.0' 'python')
makedepends=('git')
install="$pkgname.install"
source=("git+https://github.com/$_gitauthor/$_gitname.git#branch=$_gitbranch")
sha512sums=('SKIP')

package() {
  local _src="$srcdir/$_gitname/$_pluginname/$_pluginname.py"

  for _ver in 3.0 3.2; do
    if [[ -d "/usr/lib/gimp/$_ver" ]]; then
      local _dest="$pkgdir/usr/lib/gimp/$_ver/plug-ins/$_pluginname"
      echo "  El plugin se instaló en el directorio de sistema de GIMP:"
      echo "  → /usr/lib/gimp/$_ver/plug-ins/text-case-converter/"
      install -dm755 "$_dest"
      install -Dm755 "$_src" "$_dest/$_pluginname.py"
    fi
  done
}
