# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com>
# Contributor: Lucky <archlinux@builds.lucky.li>
# Contributor: carstene1ns <arch carsten-teibes de>

_gemname=nanoc
pkgname=ruby-$_gemname
pkgver=4.12.4
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
sha512sums=('14241fbdf6c4d65d4146a008f38ca43c1282d20e21d240ce10fe5e4c2db7f49a42ea18dd7db0def28539cf7a98e8e76e4a517b2f4ef3595e27c014c4634fa586')
b2sums=('07686c24d47fa978120bc2c1309d1cbf244a76757d4633965e491292426af2aa839095d6f115ba2b2acddf951dac69db00f7506af67b53c8aa83cc38e7bb7e48')

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
