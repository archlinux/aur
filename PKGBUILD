# Maintainer: George Rawlinson <grawlinson@archlinux.org>

_gemname=tty-command
pkgname=ruby-$_gemname
pkgver=0.10.1
pkgrel=1
pkgdesc="Execute shell commands with pretty logging"
arch=('any')
url="https://github.com/piotrmurach/tty-command"
license=('MIT')
depends=('ruby' 'ruby-pastel')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
b2sums=('375eed9d9b279664211b49e056e75afd6924571edc50035853f666ad2befac3ef251c803bec0733bd26a6344e1bd8b4650b4f8c33bc7f423fd67823069d62807')

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
  mv -vt "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
