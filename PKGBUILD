# Maintainer: gardenapple <mailbox@appl.garden>

_gemname=neocities
pkgname=neocities-cli
pkgver=0.0.17
pkgrel=2
pkgdesc='(Official) neocities.org CLI and API client'
arch=('any')
url='https://neocities.org/cli'
license=('MIT')
depends=('ruby' 'ruby-rake-12' 'ruby-httpclient-fixcerts' 'ruby-pastel-0.7.2' 'ruby-tty-table-0.10' 'ruby-tty-prompt-0.12')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('091d8b523a7fda50cef1097b31b3e2944ef0b1ed61a0b5d6d711f14f5b5f837c')

package() {
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	gem install --ignore-dependencies --no-user-install --no-document -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
	rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"

	rm -r "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/ext"
	find "$pkgdir$_gemdir/extensions/" -name "gem_make.out" -exec rm {} +
}
