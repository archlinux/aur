# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: farwayer <farwayer@gmail.com>

_gemname=excon
pkgname=ruby-$_gemname
pkgver=0.83.0
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
b2sums=('9073c687a941c28abc43f1dc337e6488bcb27c61f8fa39a59e75a1a1de36981f17c1f89b947eba68da1ceebeb26c29926df10cb5c7debd00a85323a29b308f3a')

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
