# Maintainer: Vinson Chuong <vinsonchuong@gmail.com>
pkgname="gitaur"
pkgver="0.1.0"
pkgrel="1"
pkgdesc="A set of command-line scripts that automate common tasks in maintaining AUR packages on GitHub"
arch=("any")
url="https://github.com/vinsonchuong/$pkgname"
license=("MIT")
depends=(
	"aura"
	"hub"
	"jq"
	"namcap"
	"ninka"
	"pkgbuild-introspection"
)
makedepends=("clidoc")
source=("$url/archive/v$pkgver-1.tar.gz")
md5sums=('2d1cae272fa6deaf3a660961e0f8c5f6')
build () 
{ 
    cd "$srcdir/$pkgname-$pkgver";
    [ -d 'doc' ] && clidoc doc/*.md
}
package () 
{ 
    cd "$srcdir/$pkgname-$pkgver";
    [ -d 'bin' ] && install -Dm755 -t "$pkgdir/usr/bin" bin/*;
    [ -d 'help' ] && install -Dm644 -t "$pkgdir/usr/share/$pkgname/help" help/*;
    [ -f 'README.md' ] && install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" 'README.md';
    [ -d 'doc' ] && install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/doc" doc/*.md;
    [ -f 'LICENSE' ] && install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" 'LICENSE';
    [ -d 'man' ] && install -Dm644 -t "$pkgdir/usr/share/man/man1" man/*
}
