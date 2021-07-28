# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Christoph Scholz <christoph.scholz@gmail.com>

_gemname=hamster
pkgname=ruby-$_gemname
pkgver=3.0.0
pkgrel=2
pkgdesc="Efficient, immutable, thread-safe collection classes for Ruby"
arch=('any')
url="https://github.com/hamstergem/hamster"
license=('MIT')
depends=('ruby' 'ruby-concurrent')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
b2sums=('f2d716d9304e9dea90b9832f1ae01bc6482fb57edc72f8e4edf0646ec066d08f9aa632401ff89dd979ee6513fcae7dab3289d8fada3a0e4392c688aca3d3e009')

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

  # delete unnecessary folders
  cd "gems/$_gemname-$pkgver"
  rm -rf spec

  # move license
  install -vd "$pkgdir/usr/share/licenses/$pkgname"
  mv -vt "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
