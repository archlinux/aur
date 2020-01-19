# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
_author='mreiferson'
_projectname='go-httpclient'
pkgname="golang-github-$_author-$_projectname"
pkgver='20160630'
_commit='31f0106b4474f14bc441575c19d3a5fa21aa1f6c'
pkgrel='1'
pkgdesc='Go HTTP client with timeouts'
arch=('any')
url="https://github.com/$_author/$_projectname"
license=('MIT')
depends=('go-pie>=1.1')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('58b16aef6eab6e981ec3f0c0cfbf60b60fc0011c2007c430e7870488e35e2932')

_builddir="$pkgname-$pkgver-$pkgrel-build"
_buildpath="src/github.com/$_author/$_projectname"

prepare() {
	cd "$srcdir/"
	mkdir -p "$_builddir/$(echo "$_buildpath" | rev | cut -d '/' -f 2- | rev)/"
	mv "$_projectname-$_commit/" "$_builddir/$_buildpath/"
}

check() {
	export GOPATH="$srcdir/$_builddir:/usr/share/gocode"
	go test -v "$srcdir/$_builddir/$_buildpath/..."
}

package() {
	cd "$srcdir/"
	install -dm755 "$pkgdir/usr/share/gocode/$(echo "$_buildpath" | rev | cut -d '/' -f 2- | rev)/"
	cp -r --no-preserve=ownership --preserve=mode "$_builddir/$_buildpath/" "$pkgdir/usr/share/gocode/$_buildpath/"
	install -dm755 "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sf "/usr/share/gocode/$_buildpath/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
