# Maintainer: Matt Harrison <matt@mistbyte.com>
# This PKGBUILD is maintained at https://github.com/matt-h/aur-pkgbuilds/tree/master/editorconfig-geany

pkgname=editorconfig-geany
pkgver=0.1
pkgrel=1
pkgdesc="EditorConfig plugin for Geany"
arch=('x86_64' 'i686')
url="https://github.com/editorconfig/editorconfig-geany"
license=('BSD')
depends=('geany' 'editorconfig-core-c')
_gitversion="8d332f12ba58bd91ac2753c8008d0558799c3aaa"
source=("https://github.com/editorconfig/editorconfig-geany/archive/$_gitversion.tar.gz")
sha256sums=('cbbe791bf1e43807e8ff31b76a9dbe6f58ba4d98cde44187adb2ad239567fb36')

build() {
  cd "$srcdir/$pkgname-$_gitversion/"
  make EDITORCONFIG_PREFIX=/usr
  sed -n '/Copyright/,/SUCH DAMAGE./p' editorconfig-geany.c > "$srcdir/LICENSE"
  sed -i 's/ \* //g' "$srcdir/LICENSE"
}

package() {
  install -Dm644 "$srcdir/$pkgname-$_gitversion/$pkgname.so" "$pkgdir/usr/lib/geany/$pkgname.so"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
