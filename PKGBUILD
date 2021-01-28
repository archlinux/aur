# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Contributor: Martin Friedrich <npanic@acid.wtf>

pkgname=kunst-git
_pkgname=kunst
pkgver=20200821
pkgrel=3
pkgdesc="kunst is a daemon that extracts the album art from the songs playing in mpd."
arch=('any')
url="https://github.com/sdushantha/kunst"
license=('MIT')
depends=('sxiv' 'imagemagick' 'bash' 'ffmpeg' 'mpd' 'mpc' 'jq')
optdepends=('perl-image-exiftool: for accurate extraction of cover images')
makedepends=('git')
provides=($_pkgname)
source=(
  "git+https://github.com/sdushantha/kunst.git"
  exiftool.patch
)
sha256sums=(
  'SKIP'
  '30f85127add3a33aa491474c949c978e9d827e13096091733a047432212adc3d'
)

pkgver() {
	cd "$srcdir/$_pkgname"

	git log -1 --format="%cd" --date=short | sed "s|-||g"
}

prepare() {
	cd "$srcdir/$_pkgname"

  patch -Np1 -i "$srcdir/exiftool.patch"
}

package() {
	cd "$srcdir/$_pkgname"
	install -D -t "$pkgdir/usr/bin" "$_pkgname"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et:
