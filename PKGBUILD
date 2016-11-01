#$Id$
# Maintainer: Greg Sutcliffe <aur@emeraldreverie.org>

_gemname=bundler_ext
pkgname=ruby-$_gemname
pkgver=0.4.1
pkgrel=1
pkgdesc='Load system gems via Bundler DSL'
arch=(any)
url='https://github.com/bundlerext/bundler_ext'
license=(MIT)
depends=(ruby ruby-bundler)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('21555412404d6060cbcba3149b9144dbefebaa97')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  find "$pkgdir/$_gemdir/extensions/" -name *.so -delete
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/MIT-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/MIT-LICENSE"
}
