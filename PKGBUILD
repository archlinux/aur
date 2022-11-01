# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Contributor: Martin Friedrich <npanic@acid.wtf>

pkgname=kunst-git
_pkgname=kunst
pkgver=20221018
pkgrel=1
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
sha512sums=('SKIP'
            'd703f6cf4e51e24ae9dcfd5b1cbf9421581a45bfa8f3579b9a1a1695ed7405fec935b2e02b81206ca05157bb24b4323abf97b43adad49c86a9476ed9e2ef03ed')

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
