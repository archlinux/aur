# Contributor: Dany Martineau <dany.luc.martineau gmail com>
# Maintainer: SanskritFritz (gmail)

_pkgname=polly-b-gone
pkgname=${_pkgname}-git
_gitname=$_pkgname
pkgver=r36.4286112
pkgrel=1
epoch=1
pkgdesc="3D physics platform game that tells the story of a plucky wheeled robot named Poll. Fork by darealshinji. Freeglut 2.8.1 included."
arch=('x86_64')
url="http://cs.stanford.edu/people/mbostock/polly/"
license=('LGPL')
depends=('sdl_mixer' 'sdl_image' 'glew' 'libgl' 'tinyxml')
source=('polly-b-gone.sh' 'polly-b-gone.png' 'polly-b-gone.desktop'
        "$_gitname::git+https://github.com/darealshinji/polly-b-gone.git")
provides=('polly-b-gone')
conflicts=('polly-b-gone')

pkgver() {
	cd "$_gitname"
# 	git log -1 --format="%cd" --date=short | sed 's|-|.|g'
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_gitname"
	autoreconf -if
	./configure
	make
}

package() {
	mkdir -p "$pkgdir/usr/share/polly-b-gone"
	cp -R "$srcdir/$_pkgname/resources" "$pkgdir/usr/share/polly-b-gone/"
	cp "$srcdir/$_pkgname/src/polly-b-gone" "$pkgdir/usr/share/polly-b-gone/"
	install -Dm644 "$srcdir/polly-b-gone.png" "$pkgdir/usr/share/pixmaps/polly-b-gone.png"
	install -Dm644 "$srcdir/polly-b-gone.desktop" "$pkgdir/usr/share/applications/polly-b-gone.desktop"
	install -Dm755 "$srcdir/polly-b-gone.sh" "$pkgdir/usr/bin/polly-b-gone"
}

md5sums=('9b1efa13bd8db4bf118a9c688be677f9'
         'e7d7277f263b4f9c5d6cd0032555f591'
         'd016d837be0f3317c74833dc8b7fc028'
         'SKIP')
