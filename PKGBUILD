# Maintainer: jfperini <@jfperini>
# Contributor: jfperini <@jfperini>

pkgname=tv-maxe-git
pkgver=0.11+r43.0906f69
pkgrel=1
pkgdesc="Watch TV channels on Linux."
url="http://code.google.com/p/tv-maxe"
arch=('any')
license=('GPL v3')
makedepends=('git')
depends=('python2' 'pygtk' 'vlc' 'mplayer' 'libstdc++5' 'sopcast' 'gstreamer0.10-python' 'ffmpeg' 'python2-pillow' 'python-virtkey')
# conflicts=('')
# provides=('')
optdepends=('lirc' 'mencoder')
install="$pkgname.install"
source=("$pkgname"::'git+https://code.google.com/p/tv-maxe')
# Because the sources are not static, skip Git checksum:
md5sums=('SKIP')

pkgver() {

	cd "$srcdir/$pkgname"
    
    	# Use the tag of the last commit
    	printf "0.11+r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

package() {

    	cd "$srcdir/$pkgname"

    	rm -rf {.git,.gitignore,CONTRIBUTORS,COPYING,CREDITS,LICENSE.txt,README.md}

    	msg2 "  -> Installing program..."
    	install -dm755 "$pkgdir/usr/share/tv-maxe"
    
    	install -Dm755 "tv-maxe" "$pkgdir/usr/bin/tv-maxe"
    	cp -avx * "$pkgdir/usr/share/tv-maxe"
    	sed -i "s|python|python2|g" "$pkgdir/usr/bin/tv-maxe"

    	msg2 "  -> Installing .desktop file..."
    	echo "[Desktop Entry]
    	Version=1.0
    	Encoding=UTF-8
    	Type=Application
    	Categories=AudioVideo
    	Name=TV-maxe
    	Comment=Watch TV channels on Linux
    	Exec=tv-maxe
    	Icon=/usr/share/tv-maxe/tvmaxe.png
    	StartupNotify=true
    	Terminal=false" | tee "tv-maxe.desktop"
    	echo -e "...Ok.\n"

    	install -Dm644  "$srcdir/$pkgname/tv-maxe.desktop" "$pkgdir/usr/share/applications/tv-maxe.desktop"

}

# vim:set ts=2 sw=2 et: