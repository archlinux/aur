# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Eric Berquist <eric dot berquist at gmail dot com>
# Contributor: Joel Goguen <contact+aur@jgoguen.ca>

pkgname=ruby-mixlib-config
_gemname="${pkgname#ruby-}"
pkgver=3.0.27
pkgrel=1
pkgdesc='A class based configuration library'
arch=('any')
url='https://github.com/chef/mixlib-config'
license=('Apache')
depends=('ruby-tomlrb')
makedepends=('ruby-rdoc')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
sha512sums=('c184e300fc7de233fd9612928a0d8a9216ddc2ff964df8c0c7086306fe4356d2c77786c009bfea8c9a1e3ebf3bccbd95644e36563c808fffd307ef20dd0dd642')
b2sums=('e4eae25e83ca924db1e098de6d2b1d6cf8e5d617e2b281f83fad02be5fa2e04ada9df077145a719a0d209819832dd4f8f9718a11b8d3b6e7365b0d31ef50d6ef')

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

  # move license
  cd "gems/$_gemname-$pkgver"
  install -vd "$pkgdir/usr/share/licenses/$pkgname"
  mv -vt "$pkgdir/usr/share/licenses/$pkgname" LICENSE NOTICE
}
