# Maintainer: Benoît Giraudou <bgiraudou@gmail.com>
pkgname=epub-thumbnailer-git
_gitname=epub-thumbnailer
pkgver=1.0r39.5d6e2ff
pkgrel=1
pkgdesc="Creates thumbnail for EPUB files."
arch=('any')
url="https://github.com/marianosimone/epub-thumbnailer"
license=('GPL3')
depends=('python2' 'python2-imaging')
makedepends=('git')
source=('git://github.com/marianosimone/epub-thumbnailer.git')
md5sums=('SKIP')

pkgver() {
	cd "$_gitname"
  	printf "1.0r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_gitname"
	sed -i 's|#!/usr/bin/python|#!/usr/bin/env python2|' src/epub-thumbnailer.py
}

package() {
  	cd "$_gitname"
  	install -dm755 ${pkgdir}/usr/bin/
  	install -m755 src/epub-thumbnailer.py ${pkgdir}/usr/bin/epub-thumbnailer
  	install -dm755 ${pkgdir}/usr/share/thumbnailers/
  	install -m644 src/epub.thumbnailer ${pkgdir}/usr/share/thumbnailers/
}
