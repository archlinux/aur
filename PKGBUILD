# Maintainer: Taylor <taylor@btxx.org>

_gemname=whirly
pkgname=ruby-whirly
pkgver=0.4.0
pkgrel=1
pkgdesc='Simple, colorful terminal spinner library for Ruby'
arch=('any')
url='https://github.com/janlelis/whirly'
license=('MIT')
depends=('ruby' 'ruby-unicode-display_width')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('3ffdf9097e711097442f6d83c91b8fc431d73224863f75b48f06fb850b3e596e')

build() {
	local _gemdir="$(gem env gemdir)"
	gem install \
		--local \
		--verbose \
		--ignore-dependencies \
		--no-user-install \
		--install-dir "tmp_install/$_gemdir" \
		--bindir "tmp_install/usr/bin" \
		$_gemname-$pkgver.gem
	rm "tmp_install/$_gemdir/cache/$_gemname-$pkgver.gem"
}

package() {
	cp -a tmp_install/* "$pkgdir"
}
