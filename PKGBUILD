# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com>
# Contributor: Lucky <archlinux@builds.lucky.li>
# Contributor: carstene1ns <arch carsten-teibes de>

_gemname=nanoc
pkgname=ruby-$_gemname
pkgver=4.12.3
pkgrel=1
pkgdesc="A static-site generator with a focus on flexibility"
arch=('any')
url="https://nanoc.app"
license=('MIT')
depends=(
  'ruby'
  'ruby-addressable'
  'ruby-colored'
  'ruby-nanoc-checking'
  'ruby-nanoc-cli'
  'ruby-nanoc-core'
  'ruby-nanoc-deploying'
  'ruby-nanoc-external'
  'ruby-nanoc-live'
  'ruby-parallel'
  'ruby-tty-command'
  'ruby-tty-which'
)
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
sha512sums=('5551fb300b148c7de9c9bc03eb6687f39900f9e2a8a673e5e2e5f4c400b6b57b66af19c2e5b5b949ca36d6c990ce58779f9ba8a49172e2c7dbb2dc706f410d05')
b2sums=('fe70f3318e5517f6c11d786b5ecc8ebca2d1114c6450ae0dfea9ea728fc3b2bb12c1a661a0f7bddf0b6c50d31957ebe4414f892ce5a8373b29881a07d91d2e9d')

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

  cd "gems/$_gemname-$pkgver"

  # move documentation
  install -vd "$pkgdir/usr/share/doc/$pkgname"
  mv -vt "$pkgdir/usr/share/doc/$pkgname" *.md

  # move license
  install -vd "$pkgdir/usr/share/licenses/$pkgname"
  mv -vt "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# vim:set ts=2 sw=2 et:
