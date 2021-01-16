# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=rchardet
pkgname=ruby-$_gemname
pkgver=1.8.0
pkgrel=1
pkgdesc="Character encoding auto-detection in Ruby"
arch=(any)
url=https://github.com/jmhodges/rchardet
license=(LGPL)
depends=(ruby)
makedepends=(ruby-rdoc rubygems)
options=(!emptydirs)
source=(https://github.com/jmhodges/rchardet/archive/v$pkgver/$_gemname-$pkgver.tar.gz)
sha256sums=('663ebadfca8ac4b93f0cd6ddb9c24139fc0cc5e75fd64aabcb75b059e066f0ae')

prepare() {
  cd "$_gemname-$pkgver"
  # "LGPL" is invalid and so gem build complains
  # the license file in the readme is LGPL 2.1
  sed -i 's/"LGPL"/"LGPL-2.1-or-later"/' $_gemname.gemspec
}

build() {
  cd "$_gemname-$pkgver"
  gem build ${_gemname}.gemspec
}

package() {
  cd "$_gemname-$pkgver"
  local _gemdir="$(gem env gemdir)"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    $_gemname-$pkgver.gem

  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

# vim: set ts=2 sw=2 et:
