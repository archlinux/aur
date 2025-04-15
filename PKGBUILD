pkgbase='simple-thumbnailers'
pkgname=(simple-thumbnailer-{pdf,vid})
pkgver=r4.6cbb699
pkgrel=1

arch=('any')
url='https://gitlab.com/zoli111/simple-thumbnailers'
license=('GPL')
source=('git+https://gitlab.com/zoli111/simple-thumbnailers')
sha256sums=('SKIP')
makedepends=('git')

pkgver() {
	cd "simple-thumbnailers" || exit
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

_package() {
	cd "simple-thumbnailers/$1/" || exit
	install -d "$pkgdir/usr/bin/" "$pkgdir/usr/share/thumbnailers/"
	install "simple-thumbnailer-$1" "$pkgdir/usr/bin/"
	install "simple-thumbnailer-$1.thumbnailer" "$pkgdir/usr/share/thumbnailers/"
}

package_simple-thumbnailer-pdf() {
	depends=('poppler')
	conflicts=('evince') # evince already provides PDF thumbnailing support
	pkgdesc='Minimal PDF thumbnailer'
	_package pdf
}

package_simple-thumbnailer-vid() {
	depends=('ffmpeg')
	conflicts=('totem' 'ffmpegthumbnailer')
	pkgdesc='Minimal video thumbnailer'
	_package vid
}
