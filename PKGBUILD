# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Andreas 'Segaja' Schleifer <segaja at archlinux dot org>

_gemname=cairo
pkgname=ruby-$_gemname
pkgver=1.17.5
pkgrel=7
pkgdesc='Ruby bindings for cairo'
arch=('x86_64')
url='https://cairographics.org/rcairo'
license=('Ruby')
depends=('ruby' 'cairo' 'ruby-pkg-config' 'ruby-native-package-installer' 'ruby-red-colors')
makedepends=('ruby-rdoc')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=($_gemname-$pkgver.gem)
sha512sums=('f2ade6fb6b9fccd81a11061b277d4a9077936e0beef42c61225bd4d5630586a57a3fa192a20a0f7e4922313e2a8215268bc9a5d007d2805cf1f80714fd9ad1ba')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  local _platform="$(gem env platform | cut -d':' -f2)"
  local _extension_api_version="$(ruby -e'puts Gem.extension_api_version')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm -r "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem" "${pkgdir}/${_gemdir}/extensions/${_platform}/${_extension_api_version}/${_gemname}-${pkgver}/gem_make.out" "${pkgdir}/${_gemdir}/gems/${_gemname}-${pkgver}/ext/cairo/Makefile" "${pkgdir}/${_gemdir}/doc/${_gemname}-${pkgver}/ri/ext"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
