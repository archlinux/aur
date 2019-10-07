# Maintainer: awh

pkgname=pup-git
_gitname="pup"
_gourl="github.com/ericchiang/pup"
pkgver=r97.b058f91
pkgrel=1
epoch=1
pkgdesc="Parsing HTML at the command line"
arch=('any')
url="https://github.com/EricChiang/pup"
license=('MIT')
provides=('pup')
conflicts=('pup')
makedepends=('git' 'go')
source=('git://github.com/EricChiang/pup.git')
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_gitname"
    go build -trimpath -ldflags "-extldflags $LDFLAGS" .
}

package() {
    cd "$_gitname"
	mkdir -p "$pkgdir/usr/bin"
	install -p -m755 "$srcdir/$_gitname/$_gitname" "$pkgdir/usr/bin"

	# Package license (if available)
	for f in LICENSE COPYING LICENSE.* COPYING.*; do
		if [ -e "$f" ]; then
			install -Dm644 "$f" \
				"$pkgdir/usr/share/licenses/$_gitname/$f"
		fi
	done
}
