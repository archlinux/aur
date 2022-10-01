# Maintainer: George Rawlinson <grawlinson@archlinux.org>

_gemname=dry-inflector
pkgname=ruby-$_gemname
pkgver=0.3.0
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
b2sums=('3915f51de7fe5a9cb8c5bee5e3937ef57657db9681992f100271b1c368bf4bff3762f3739ff3feee6090e2d2d9e38494db36285a17cdff4b8c5c3992d87ada3d')

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
