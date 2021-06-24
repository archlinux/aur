# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Contributor: Martin Friedrich <npanic@acid.wtf>

pkgname=kunst-git
_pkgname=kunst
pkgver=20200821
pkgrel=4
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
sha512sums=(
  'SKIP'
  '94e554c8e13bc8c9b9d12ee904545a66c3b984dc2083d5103f82746b783719c505694092f0271f4ea165e0e229184fc11e99dae96cb2f0ab9788b61567cf4f9d'
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
