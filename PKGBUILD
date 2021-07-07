# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: farwayer <farwayer@gmail.com>

_gemname=excon
pkgname=ruby-$_gemname
pkgver=0.84.0
pkgrel=1
pkgdesc="EXtended http(s) CONnections"
arch=('any')
url="https://github.com/excon/excon"
license=('MIT')
depends=('ruby')
makedepends=('rubygems' 'ruby-rdoc')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
b2sums=('d97fa54f07c3ae6c31fac57531a8d51c52b3503abdb26a36278f0010ee6a099c7217d2db75355f4197ca2d0b84af37843c070980ee428cb2d69be6199693670b')

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

  cd "gems/$_gemname-$pkgver"

  # move documentation
  install -vd "$pkgdir/usr/share/doc/$pkgname"
  mv -vt "$pkgdir/usr/share/doc/$pkgname" \
    CONTRIBUTING.md CONTRIBUTORS.md README.md

  # move license
  install -vd "$pkgdir/usr/share/licenses/$pkgname"
  mv -vt "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}
