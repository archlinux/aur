# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Jeremy Audet <jerebear@protonmail.com>

_gemname=lumberjack
pkgname=ruby-$_gemname
pkgver=1.2.8
pkgrel=1
pkgdesc="A simple, powerful, and fast logging implementation"
arch=('any')
url="https://github.com/bdurand/lumberjack"
license=('MIT')
depends=('ruby')
makedepends=('ruby-rdoc')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
b2sums=('6774fd5c483197b91e27a6f4d91d41ce1f3477177ea71b674ecfa4e616849e4dee88d3634e2ac1f414f528746c27ce713095aa35fbc33aa5a227f9504b84a739')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install \
    --verbose \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "$pkgdir/$_gemdir" \
    --bindir "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"

  # delete cache
  cd "$pkgdir/$_gemdir"
  rm -vrf cache

  # delete unnecessary files & folders
  cd "gems/$_gemname-$pkgver"
  rm -vrf "$_gemname.gemspec" VERSION

  # move documentation
  install -vd "$pkgdir/usr/share/doc/$pkgname"
  mv -vt "$pkgdir/usr/share/doc/$pkgname" *.md

  # move license
  install -vd "$pkgdir/usr/share/licenses/$pkgname"
  mv -v MIT_LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
