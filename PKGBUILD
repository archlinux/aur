# Maintainer: Michael Kogan <michael dot kogan at gmx dot net >

pkgname=xournalpp-plugin-functionplotter-git
_pkgname=plotter
pkgver=r5070.2d42e1c7
pkgrel=1
pkgdesc='Basic function plotter plugin for Xournal++ using the recent Lua API extension'
arch=('any')
license=('GPL2')
url='https://github.com/xournalpp/xournalpp/pull/3811'
depends=('lua-lgi' 'xournalpp')
makedepends=('git')
source=(plotter::git+https://github.com/rolandlo/xournalpp.git#branch=feature-lua-function-plotter)
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package(){
	cd "$_pkgname"
	install -d -m755 "$pkgdir/usr/share/xournalpp/plugins/"
	cp -r "plugins/FunctionPlotter/" "$pkgdir/usr/share/xournalpp/plugins/"
}
