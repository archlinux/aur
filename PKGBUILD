# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Joel Goguen <contact+aur@jgoguen.ca>
# Contributor: Christopher Loen <christopherloen at gmail dot com>
# Contributor: Artem Vorotnikov <artem@vorotnikov.me>

pkgname=ruby-mixlib-shellout
_gemname="${pkgname#ruby-}"
pkgver=3.2.7
pkgrel=1
pkgdesc='Run external commands on Unix or Windows'
arch=('any')
url='https://github.com/chef/mixlib-shellout'
license=('Apache')
depends=('ruby' 'ruby-chef-utils')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
b2sums=('c635398b8d604fc597a9ddb1fa23a8372ebaabb311619658d1b10e4f78359396b8b991fc20449e44ccb322e17e7d3a1a01465a8809c304713395dd90c5612dc9')

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
