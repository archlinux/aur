# Maintainer: Bert Peters <bert@bertptrs.nl>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=yajl-ruby
pkgname=ruby-$_gemname
pkgver=1.4.3
pkgrel=1
pkgdesc='Ruby C bindings to the excellent Yajl JSON stream-based parser library.'
arch=('x86_64' 'i686' 'armv7h')
url='http://github.com/brianmario/yajl-ruby'
license=('MIT')
depends=('ruby' 'ruby-rdoc')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('8c974d9c11ae07b0a3b6d26efea8407269b02e4138118fbe3ef0d2ec9724d1d2')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  # This file has an annoying path to reproduce, just use find
  find "$pkgdir/$_gemdir" -name gem_make.out -delete
  install -D -m644 "${pkgdir}${_gemdir}/gems/${_gemname}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
