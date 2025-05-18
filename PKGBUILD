# Maintainer: envolution
# Contributor: Vojtěch Aschenbrenner <v@asch.cz>
# shellcheck shell=bash disable=SC2034,SC2154

_gemname=ncursesw
pkgname=ruby-ncursesw
pkgver=1.4.13
pkgrel=1
pkgdesc='wraps functions, macros, global variables and constants of the ncurses library.'
arch=(i686 x86_64)
url='http://github.com/sup-heliotrope/ncursesw-ruby'
license=(LGPL-2.1-only)
depends=(ruby ncurses glibc)
options=(!emptydirs)
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/sup-heliotrope/ncursesw-ruby/archive/refs/tags/v${pkgver}.tar.gz"
)
sha1sums=('10ec76fac97d7494d57dc0a1fd3f1e280f3546e6')

prepare() {
  cd "${_gemname}-ruby-${pkgver}"
  ruby extconf.rb
}
build() {
  cd "${_gemname}-ruby-${pkgver}"
  make
  gem build ncursesw.gemspec
}
package() {
  cd "${_gemname}-ruby-${pkgver}"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
# vim:set ts=2 sw=2 et:
