# Contributor: Dany Martineau <dany.luc.martineau gmail com>
# Maintainer: SanskritFritz (gmail)

_pkgname=polly-b-gone
pkgname=${_pkgname}-git
_gitname=$_pkgname
pkgver=2013.01.30
pkgrel=1
epoch=1
pkgdesc="3D physics platform game that tells the story of a plucky wheeled robot named Poll."
arch=('i686' 'x86_64')
url="http://cs.stanford.edu/people/mbostock/polly/"
license=('LGPL')
depends=('sdl_mixer' 'sdl_image' 'freeglut' 'glew' 'libgl' 'tinyxml')
source=('polly-b-gone.sh' 'polly-b-gone.png' 'polly-b-gone.desktop'
        "git://github.com/SanskritFritz/$_gitname.git")
provides=('polly-b-gone')
conflicts=('polly-b-gone')

pkgver() {
	cd "$_gitname"
	git log -1 --format="%cd" --date=short | sed 's|-|.|g'
}

build() {
	cd "$srcdir/$_gitname"
	make
}

package() {
	cd "$srcdir/$_gitname"
	mkdir -p "$pkgdir/usr/share/polly-b-gone"
	cp -R resources "$pkgdir/usr/share/polly-b-gone/"
	cp polly-b-gone "$pkgdir/usr/share/polly-b-gone/"
	install -Dm644 "$srcdir/polly-b-gone.png" "$pkgdir/usr/share/pixmaps/polly-b-gone.png"
	install -Dm644 "$srcdir/polly-b-gone.desktop" "$pkgdir/usr/share/applications/polly-b-gone.desktop"
	install -Dm755 "$srcdir/polly-b-gone.sh" "$pkgdir/usr/bin/polly-b-gone"
}

md5sums=('9b1efa13bd8db4bf118a9c688be677f9'
         'e7d7277f263b4f9c5d6cd0032555f591'
         'd016d837be0f3317c74833dc8b7fc028'
         'SKIP')
