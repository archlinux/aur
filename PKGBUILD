# Maintainer: Michal Kimle <kimle.michal@gmail.com>

_gemname=rpi_gpio
pkgname=ruby-$_gemname
pkgver=0.5.0
pkgrel=1
pkgdesc='Ruby conversion of RPi.GPIO Python module'
arch=(aarch64 armv6h armv7h)
url='https://github.com/ClockVapor/rpi_gpio'
license=(MIT)
depends=(ruby ruby-epoll)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('96e14bd31a83a997ef4875adccdcd5476cf658b15c8861a7f759f1d2d0e7771b')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  local _rubyversion="$(ruby -e'puts Gem.ruby_api_version')"
  HOME="/tmp" GEM_HOME="$_gemdir" GEM_PATH="$_gemdir" gem install -N --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  rm "$pkgdir/$_gemdir/extensions/"*"/$_rubyversion/$_gemname-$pkgver/gem_make.out"
}
