# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: bgkillas <bgkillas@gmail.com>
pkgname=p7zip-jinfeihan57-git
pkgdesc="Command-line file archiver with high compression ratio - jinfeihan57 fork"
pkgver=v17.04.r6.geb1bbb0
pkgrel=1
arch=('x86_64')
makedepends=('git')
depends=(gcc-libs)
optdepends=()
provides=('p7zip')
conflicts=('p7zip')
url="https://github.com/jinfeihan57/p7zip"
license=('LGPL')
source=('git+https://github.com/jinfeihan57/p7zip.git'
        '7z')
sha512sums=('SKIP'
            'SKIP')
pkgver() {
	cd p7zip
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
            
build () {
	cd p7zip
	make 7z
}

package() {
	mkdir -p "$pkgdir/usr/lib/p7zip/Codecs"
	mkdir -p "$pkgdir/usr/bin"
	install -Dm755 "7z" "$pkgdir/usr/bin/"
	install -Dm755 "$srcdir/p7zip/bin/7z" "$pkgdir/usr/lib/p7zip/"
	install -Dm755 "$srcdir/p7zip/bin/7z.so" "$pkgdir/usr/lib/p7zip/"
	install -Dm755 "$srcdir/p7zip/bin/Codecs/Rar.so" "$pkgdir/usr/lib/p7zip/Codecs"
}
