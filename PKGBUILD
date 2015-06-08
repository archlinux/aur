# Maintainer: Jon Gjengset <jon@tsp.io>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
_gemname=experiment
pkgname=$_gemname
pkgver=0.7.1
pkgrel=2
pkgdesc="A tool for running concurrent multi-configuration experiments"
arch=('any')
url="https://github.com/jonhoo/experiment"
license=('MIT')
depends=('ruby'
         'ruby-colorize'
         'ruby-commander'
         'ruby-progressbar'
         'ruby-rugged')
makedepends=('rubygems')
source=(${_gemname}-${pkgver}.tar.gz::https://codeload.github.com/jonhoo/${_gemname}/tar.gz/v${pkgver})
sha256sums=('cada825ca2026f3e9a65966f6db7b828787b06fb2813aff246ade938494a180e')

build() {
  cd "$srcdir/${_gemname}-$pkgver"
  gem build ${_gemname}.gemspec
}

package() {
  cd "$srcdir/${_gemname}-$pkgver"
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install \
    --no-user-install \
    --ignore-dependencies \
    -i "$pkgdir$_gemdir" \
    -n "$pkgdir/usr/bin" \
    "${_gemname}-${pkgver}.gem"
}

# vim:set ts=2 sw=2 et:
