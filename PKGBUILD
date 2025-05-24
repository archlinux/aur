# Maintainer: bozidarsk <aaaa@gmail.com>
name='whiteboard-gtkwebview'
pkgname="$name-git"
pkgver=1
pkgrel=2
pkgdesc="Gtk4 WebView for microsoft whiteboard."
arch=('x86_64')
url="https://github.com/bozidarsk/$name"
license=('unknown')
depends=('webkitgtk-6.0')
makedepends=('pkgconf' 'gcc' 'webkitgtk-6.0')

# to update version
# makepkg --printsrcinfo > .SRCINFO

prepare() 
{
	git clone "$url.git" "$srcdir/$name"
}

build() 
{
	cd "$srcdir/$name"
	gcc $(pkg-config --cflags webkitgtk-6.0) $(pkg-config --libs webkitgtk-6.0) -Wall -Wextra -Wpedantic main.c -o whiteboard-gtkwebview
}

package() 
{
	install -vDm755 "$srcdir/$name/whiteboard-gtkwebview" -t "$pkgdir/usr/bin/"
	install -vDm644 "$srcdir/$name/whiteboard.desktop" -t "$pkgdir/usr/share/applications/"
	install -vDm644 "$srcdir/$name/whiteboard-gtkwebview.ico" -t "$pkgdir/usr/share/pixmaps/"
}
