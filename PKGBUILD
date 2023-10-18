# Maintainer: xiota / aur.chaotic.cx
# Contributor: adrusi <adrian at adrusi dot com>

_pkgname="terra"
pkgname="$_pkgname-bin"
pkgver=1.1.1
pkgrel=1
pkgdesc='Low-level system programming language designed to interoperate seamlessly with Lua'
arch=('x86_64')
url='https://github.com/terralang/terra'
license=('MIT')

options=(!strip !debug)

if [ x"$pkgname" != x"$_pkgname" ] ; then
  provides=(terra)
  conflicts=(terra)
fi

_commit='094c5ad'

_pkgsrc="terra-Linux-$CARCH-$_commit"
_pkgext="tar.xz"
source=(
  "$_pkgname-$pkgver-$_commit.$_pkgext"::"$url/releases/download/release-$pkgver/terra-Linux-$CARCH-$_commit.$_pkgext"
)
sha256sums=(
  '6c75e69f50b50153987a655b51ebfc352155946d077b7808f5465b23a24a501d'
)

package() {
  cd "$_pkgsrc"

  mkdir -p "$pkgdir"/usr/{lib,include/terra}
  install -Dm644 include/terra/* "$pkgdir/usr/include/terra"
  install -Dm644 lib/* "$pkgdir/usr/lib"
  install -Dm644 share/terra/LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm755 bin/terra "$pkgdir/usr/bin/terra"
}

