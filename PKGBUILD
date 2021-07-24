# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Joel Goguen <contact+aur@jgoguen.ca>
# Contributor: Christopher Loen <christopherloen at gmail dot com>
# Contributor: Artem Vorotnikov <artem@vorotnikov.me>

_gemname=mixlib-shellout
pkgname=ruby-$_gemname
pkgver=3.2.5
pkgrel=2
pkgdesc="Run external commands on Unix or Windows"
arch=('any')
url="https://github.com/chef/mixlib-shellout"
license=('Apache')
depends=('ruby' 'ruby-chef-utils')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
b2sums=('05c35f8d06aa8a7f8fb990e5c673976aa2df0fd3c62adca2dcd3719d390495ce897162df8f1c496a7dd4f577c98884ae5a2e154cd92add43848aadb5725bda17')

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
  mv -vt "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
