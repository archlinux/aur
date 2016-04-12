pkgname=vulcan-editor-git
pkgver=62.72b6297
pkgrel=1
pkgdesc="A minimalistic editor for gtk3"
arch=('i686' 'x86_64')
url="https://github.com/zesterer/vulcan"
license=('unknown OpenSource')
depends=('gtk3' 'vte' 'pango' 'gtksourceview3' 'glib2' 'vala')
makedepends=('git')
provides=('vulcan-editor')
source=("$pkgname"::'git+https://github.com/zesterer/vulcan.git')
# Because the sources are not static, skip Git checksum:
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  # Use the tag of the last commit
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  ./compile.sh
}

package() {
  install -D -m755 "${srcdir}/${pkgname}/vulcan" "$pkgdir/usr/bin/vulcan-editor"
  #wait for license install -D -m644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
