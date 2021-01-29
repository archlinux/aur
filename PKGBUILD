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
  '5a0696c2c83aa020a660a2cc2a7eaeaac36bcc8b57817b4b5fcf22ea01545ea1'
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
