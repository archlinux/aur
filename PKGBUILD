# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Andreas 'Segaja' Schleifer <segaja at archlinux dot org>

_gemname=cairo
pkgname=ruby-$_gemname
pkgver=1.17.6
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
sha512sums=('228696ec0f58d85dbe688444229630b26a610cc39065917cda662a3a89c6460ba817c1884d31f6fb526214b385886d7fa6c112be2220d8983f677a9b69b784ff')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  local _platform="$(gem env platform | cut -d':' -f2)"
  local _extension_api_version="$(ruby -e'puts Gem.extension_api_version')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm -r "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem" "${pkgdir}/${_gemdir}/extensions/${_platform}/${_extension_api_version}/${_gemname}-${pkgver}/gem_make.out" "${pkgdir}/${_gemdir}/gems/${_gemname}-${pkgver}/ext/cairo/Makefile" "${pkgdir}/${_gemdir}/doc/${_gemname}-${pkgver}/ri/ext"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
