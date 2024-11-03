# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Andreas 'Segaja' Schleifer <segaja at archlinux dot org>

_gemname=cairo
pkgname=ruby-$_gemname
pkgver=1.17.13
pkgrel=1
pkgdesc='Ruby bindings for cairo'
arch=('x86_64')
url='https://cairographics.org/rcairo'
license=('Ruby')
depends=('ruby' 'cairo' 'ruby-pkg-config' 'ruby-native-package-installer' 'ruby-red-colors')
makedepends=('ruby-rdoc')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=($_gemname-$pkgver.gem)
sha512sums=('82fb621f97b6eb292565fd0f90f5e686c2cd4cd8aa61fa0ab6e25aac665aa9f7e780481a6571fd443be8c53070f29a2dfea5a54949350fe783b12aeb6aba3769')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  local _platform="$(gem env platform | cut -d':' -f2)"
  local _extension_api_version="$(ruby -e'puts Gem.extension_api_version')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm -r "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem" "${pkgdir}/${_gemdir}/extensions/${_platform}/${_extension_api_version}/${_gemname}-${pkgver}/gem_make.out" "${pkgdir}/${_gemdir}/gems/${_gemname}-${pkgver}/ext/cairo/Makefile" "${pkgdir}/${_gemdir}/doc/${_gemname}-${pkgver}/ri/ext"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
