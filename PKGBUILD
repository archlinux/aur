# Maintainer: George Rawlinson <george@rawlinson.net.nz>

_gemname=tzinfo-data
pkgname=ruby-$_gemname
pkgver=1.2022.5
pkgrel=1
pkgdesc='Timezone data for ruby-tzinfo'
arch=('x86_64')
url='https://github.com/tzinfo/tzinfo-data'
license=('MIT')
depends=('ruby' 'ruby-tzinfo')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
sha512sums=('5604274757b09674268a960fc3a6f7af20c23a8154c37862be1df1cc982f35ad48a6fa790589c9963f5e5c01236bd137eb439212beba941ec9f43a70526a0d33')
b2sums=('b0031fa2bda75c8bbb70ccf888f0f456e8bcccd564aff9d3ce724585879bddc1c1f7dbdcdf6b6a84534ed38008b061c638b251beebebc031f653893a4e835587')

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
