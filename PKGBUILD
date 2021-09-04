# Maintainer: Bert Peters <bert@bertptrs.nl>
pkgname=wayback_machine_downloader
pkgver=2.3.1
pkgrel=1
pkgdesc='Downloader for pages in the Internet Archive'
arch=(any)
url='https://github.com/hartator/wayback-machine-downloader'
license=(MIT)
depends=(ruby)
makedepends=(ruby-rdoc)
source=(https://rubygems.org/downloads/$pkgname-$pkgver.gem
	$pkgname-LICENSE::https://raw.githubusercontent.com/hartator/wayback-machine-downloader/$pkgver/MIT-LICENSE.txt)
noextract=($pkgname-$pkgver.gem)
sha256sums=('958ddabba1c04528a66766eb187a88571f0d1768e83dabc4140c43adb411049c'
            '1819d92f27aa541378c8421df329c54f404168b5bcd6d981f237a33e15f63d5b')
options=(!emptydirs)

package() {
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $pkgname-$pkgver.gem
	rm "$pkgdir/$_gemdir/cache/$pkgname-$pkgver.gem"

	# License file is missing from the gem but we can install it anyway.
	install -D "$pkgname-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
