# Maintainer: Bert Peters <bert@bertptrs.nl>
pkgname=wayback_machine_downloader
pkgver=2.2.1
pkgrel=2
pkgdesc='Downloader for pages in the Internet Archive'
arch=(any)
url='https://github.com/hartator/wayback-machine-downloader'
license=(MIT)
depends=(ruby)
makedepends=(ruby-rdoc)
source=(https://rubygems.org/downloads/$pkgname-$pkgver.gem
	$pkgname-LICENSE::https://raw.githubusercontent.com/hartator/wayback-machine-downloader/$pkgver/MIT-LICENSE.txt)
noextract=($pkgname-$pkgver.gem)
sha256sums=('623e5ef663930bb15f0dc46db21e33765a5f99b1f986a5308c4ad7ba2b0e6b8a'
            '1819d92f27aa541378c8421df329c54f404168b5bcd6d981f237a33e15f63d5b')
options=(!emptydirs)

package() {
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $pkgname-$pkgver.gem
	rm "$pkgdir/$_gemdir/cache/$pkgname-$pkgver.gem"

	# License file is missing from the gem but we can install it anyway.
	install -D "$pkgname-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
