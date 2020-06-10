# Contributor: Tambet Arak <tambet dot arak at gmail>
# Contributor: Christoph Scholz <christoph.scholz@gmail.com>

_gemname=ruby-beautify2
pkgname=ruby-$_gemname-git
pkgver=0.98.0
pkgrel=1
pkgdesc='A CLI tool and Ruby module to beautify Ruby code'
arch=(any)
url='https://github.com/jirutka/ruby-beautify2'
license=('MIT')
depends=(ruby)
makedepends=(git)
conflicts=('ruby-ruby-beautify')
provides=('ruby-ruby-beautify')
options=(!emptydirs)
source=("git://github.com/jirutka/${_gemname}.git")
sha1sums=('SKIP')

pkgver() {
    cd "$srcdir/$_gemname"
    git describe --always | sed 's|-|.|g' | sed 's|^v||'
}

build() {
    cd "$srcdir/$_gemname"
    rm -f bin/rbeautify
    gem build "$_gemname.gemspec"
}

package() {
    cd "$srcdir/$_gemname"
    
    local _gemdir="$(ruby -e'puts Gem.default_dir')"
    gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
    rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
    install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

