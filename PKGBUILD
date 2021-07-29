# Mainteiner: George Rawlinson <grawlinson@archlinux.org>
# Contributor: farwayer <farwayer@gmail.com>

_gemname=colored
pkgname=ruby-${_gemname}
pkgver=1.2
pkgrel=6
pkgdesc='Ruby library for colorizing text output in your terminal'
arch=('any')
url="http://github.com/defunkt/colored"
license=('MIT')
depends=('ruby')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
b2sums=('cb384fe13692d453f86e403a8684604d07543e3ea3270ad15b6d6d8be2c0d3610911a23b82f23c40e0472f40174a290948804eeb8cf5c496f36ab49d56ee4413')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    --no-document \
    --install-dir "$pkgdir/$_gemdir" \
    --bindir "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"

  # delete cache
  cd "$pkgdir/$_gemdir"
  rm -vrf cache

  # delete unnecessary files
  cd "gems/$_gemname-$pkgver"
  rm -vrf Rakefile

  # move documentation
  install -vd "$pkgdir/usr/share/doc/$pkgname"
  mv -vt "$pkgdir/usr/share/doc/$pkgname" README

  # move license
  install -vd "$pkgdir/usr/share/licenses/$pkgname"
  mv -vt "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
