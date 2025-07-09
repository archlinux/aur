# Maintainer:
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=ruby-readline-ext
_gemname=${pkgname#ruby-}
pkgver=0.2.0
pkgrel=1
pkgdesc="Provides an interface for GNU Readline and Edit Line (libedit)."
arch=("x86_64")
depends=(
  'bash'
  'glibc'
  'readline'
  'ruby'
)
makedepends=(rubygems)
url="https://rubygems.org/gems/readline-ext"
noextract=($_gemname-$pkgver.gem)
license=("BSD-2-Clause")
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
sha256sums=('490ad4a5534243c554b05db6f2dd364c61aea4759fa7613692a5e5c74ec3eaa8')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    $_gemname-$pkgver.gem

  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
