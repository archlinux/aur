# Maintainer: George Rawlinson <george@rawlinson.net.nz>

_gemname=tzinfo-data
pkgname=ruby-$_gemname
pkgver=1.2021.2
pkgrel=1
pkgdesc='Timezone data for ruby-tzinfo'
arch=('x86_64')
url='https://github.com/tzinfo/tzinfo-data'
license=('MIT')
depends=('ruby' 'ruby-tzinfo')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
sha512sums=('698a0f0d39158635f038b7bb4ec2849dc963d174f7603c50810005139672706dddd6a92356bc3ce68384c6157bb20008cd3306955c2a2272e81521e48c95ad88')
b2sums=('a26d40ccf386322a2b0ab4a37fa384be2f79abe5a96a3f8d40e65adfd45ca7570d3423223b0cb2b23b4b5a5bf5900bb793382ec49f8696cad4ef62be944fcb53')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install \
    --verbose \
    --ignore-dependencies \
    --no-document \
    --no-user-install \
    --install-dir "$pkgdir/$_gemdir" \
    --bindir "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"

  # delete cache
  cd "$pkgdir/$_gemdir"
  rm -rf cache

  # delete unnecessary files & folders
  cd "gems/$_gemname-$pkgver"
  find . -type f -name ".*" -delete

  # move documentation
  install -vd "$pkgdir/usr/share/doc/$pkgname"
  mv *.md "$pkgdir/usr/share/doc/$pkgname"

  # move license
  install -vd "$pkgdir/usr/share/licenses/$pkgname"
  mv LICENSE "$pkgdir/usr/share/licenses/$pkgname"
}
