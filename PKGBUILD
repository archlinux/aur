# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com>
# Contributor: Lucky <archlinux@builds.lucky.li>
# Contributor: carstene1ns <arch carsten-teibes de>

_gemname=nanoc
pkgname=ruby-$_gemname
pkgver=4.12.7
pkgrel=1
pkgdesc='A static-site generator with a focus on flexibility'
arch=('any')
url='https://nanoc.app'
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
sha512sums=('ef048b1a68518b3c425bd0325a0ba4dc1467a2b1acebce65a91ea25ef8da8799176a9da870dce6bd4789eb6062e7b7b76fc6dc3b22a9ffd794701694c0e45d27')
b2sums=('81b9d42bb4e599ad755cb4c6ede27c5fc3fb3666e9516c182e4b22a6ac0d96e1f25af69a29a8479e93f234d6bd68077fbc68dd3550f0e74f04c506d856ff015e')

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
