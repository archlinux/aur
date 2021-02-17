# Maintainer: Darren Ng <$(base64 --decode <<<'VW4xR2ZuQGdtYWlsLmNvbQo=')>

_gemname=dirtree

pkgname=$_gemname
pkgver=1.0.0
pkgrel=1
pkgdesc='display list of file paths as an interactive tree'
arch=(any)
url='https://github.com/emad-elsaid/dirtree'
license=(RUBY)
depends=(ruby)
provides=(ruby-$_gemname)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
sha256sums=(3104451df43dbabe969c7de86abfdc333001b79186ec72a4678fdde5b732d875)
noextract=($_gemname-$pkgver.gem)

package() {

  local _gemdir="$(ruby -e 'puts Gem.default_dir')"

  # gem install --help
  gem install \
    --install-dir "$pkgdir/$_gemdir" \
    --bindir "$pkgdir/usr/bin" \
    --ignore-dependencies \
    --no-user-install \
    --local \
    --verbose \
    ./$_gemname-$pkgver.gem

  rm -rfv "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/ext"
  rm  -fv "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -dm755 "$pkgdir/usr/share/bash-completion/completions/"; mv -v "$pkgdir/usr/lib/ruby/gems/2.7.0/gems/$_gemname-$pkgver/exe/$_gemname-completion.bash" "$_/$_gemname"

}
