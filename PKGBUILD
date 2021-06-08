# Maintainer: Mark Stenglein <aur@markstenglein.com>
# Contributor: Marcel Korpel <marcel[dot]korpel[at]gmail>
# Contributor: Peter Richard Lewis <plewis@aur.archlinux.org>

_gemname=commander
pkgname=ruby-$_gemname
pkgver=4.6.0
pkgrel=1
pkgdesc='The complete solution for Ruby command-line executables. Commander bridges the gap between other terminal related libraries you know and love (OptionParser, HighLine), while providing many new features, and an elegant API.'
arch=('any')
url='https://github.com/commander-rb/commander'
license=('MIT')
options=(!emptydirs)
noextract=($_gemname-$pkgver.gem)
depends=('ruby' 'ruby-highline')
makedepends=('rubygems')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
sha256sums=('7d1ddc3fccae60cc906b4131b916107e2ef0108858f485fdda30610c0f2913d9')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -Dm644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

