# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=scss_lint
pkgname=ruby-$_gemname
pkgver=0.56.0
pkgrel=2
pkgdesc='Configurable tool for writing clean and consistent SCSS.'
arch=('any')
url='https://github.com/brigade/scss-lint'
license=('MIT')
options=(!emptydirs)
noextract=($_gemname-$pkgver.gem)
depends=('ruby' 'ruby-sass' 'ruby-rainbow')
makedepends=('ruby-rdoc')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
sha256sums=('0f04fa7e6a5a45535dc93c4f54026fab71bc8fcec17217c37310c460659e6e05')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    $_gemname-$pkgver.gem

  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"

  install -Dm0644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/MIT-LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
