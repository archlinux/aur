# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Eric Berquist <eric dot berquist at gmail dot com>
# Contributor: Joel Goguen <contact+aur@jgoguen.ca>

_gemname=mixlib-config
pkgname=ruby-$_gemname
pkgver=3.0.9
pkgrel=1
pkgdesc="A class based configuration library"
arch=('any')
url="https://github.com/chef/mixlib-config"
license=('Apache')
depends=('ruby-tomlrb')
makedepends=('ruby-rdoc')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
b2sums=('562b7dba2745843fad64f2318eb8e08bf7a32c57ad4bb4e4e2add9ff67725328eb3d93f8a0232383eb368c5e8d84b9ed35777f0c6ce6150ec8fcd6b0049e5067')

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
