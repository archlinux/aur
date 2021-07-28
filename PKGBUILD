# Maintainer: George Rawlinson <grawlinson@archlinux.org>

_gemname=tty-platform
pkgname=ruby-$_gemname
pkgver=0.3.0
pkgrel=1
pkgdesc="Query methods for detecting different operating systems and their properties"
arch=('any')
url="https://ttytoolkit.org"
license=('MIT')
depends=('ruby')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
b2sums=('3c7aa22caeeeadb07222c67db9fb888361e70f7b5b9b49ecfa681738bf82759ac836f462cbeba5c8d918069b41332d07ad4a4cde311074edaf69850880a8c0e8')

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
