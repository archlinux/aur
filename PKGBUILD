# Maintainer: George Rawlinson <grawlinson@archlinux.org>

_gemname=dry-inflector
pkgname=ruby-$_gemname
pkgver=1.0.0
pkgrel=1
pkgdesc='String inflections for Ruby'
arch=('any')
url='https://github.com/dry-rb/dry-inflector'
license=('MIT')
depends=('ruby')
makedepends=('ruby-rdoc')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
b2sums=('f5d44108cf0d44c646a4a395b7adcda5fa4e5f355d45bd399b230ab35cb21c9e0f7f26ea737e320de60ae0da0d1d0c9afb5218fd4d25b6b6af969b434b63a4b9')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install \
    --local \
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
  rm -vrf "$_gemname.gemspec"

  # move documentation
  install -vd "$pkgdir/usr/share/doc/$pkgname"
  mv -vt "$pkgdir/usr/share/doc/$pkgname" *.md

  # move license
  install -vd "$pkgdir/usr/share/licenses/$pkgname"
  mv -vt "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
