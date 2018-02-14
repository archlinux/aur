_gemname=twterm
pkgname=$_gemname
pkgver=2.2.0
pkgrel=1
pkgdesc='A full-featured TUI Twitter client.'
arch=(x86_64)
url='http://twterm.ryota-ka.me/'
license=(MIT)
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('33be380389a6db7c08e50cf3b01b2ac5b48327f2')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  find "$pkgdir/$_gemdir/extensions/" -name *.so -delete
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

#  rm -r "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/ext"
}
