# Maintainer: Vinson Chuong <vinsonchuong@gmail.com>
pkgname="clidoc"
pkgver="0.0.1"
pkgrel="3"
pkgdesc="Generate man pages and help text from Markdown-formatted docs"
arch=("any")
url="https://github.com/vinsonchuong/$pkgname"
license=("MIT")
depends=(
	"ruby-ronn"
	"xidel"
)
source=("$url/archive/v$pkgver.tar.gz")
md5sums=('46afdf1c2b9f152739f6c8618f29899c')
build () 
{ 
    cd "$srcdir/$pkgname-$pkgver";
    [ -d 'doc' ] && bin/clidoc doc/*.md
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
