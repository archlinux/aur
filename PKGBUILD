# Maintainer: bozidarsk <aaaa@gmail.com>
name='wifi-menu'
pkgname="$name-git"
pkgver=1
pkgrel=1
pkgdesc="Gtk3 layer shell window for managing wifi connections."
arch=('x86_64')
url="https://github.com/bozidarsk/$name"
license=('unknown')
depends=('mono' 'gtk-sharp-3' 'gtk-layer-shell')
makedepends=('git' 'mono' 'gtk-sharp-3')

# to update version
# makepkg --printsrcinfo > .SRCINFO

prepare() 
{
	git clone "$url.git" --recurse-submodules "$srcdir/$name"
}

build() 
{
	cd "$srcdir/$name"
	mcs '-recurse:*.cs' -pkg:gtk-sharp-3.0 -out:"$name"
}

package() 
{
	install -vDm755 "$srcdir/$name/$name" -t "$pkgdir/usr/bin/"
}
