# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=ruby-jekyll-jade-git
_gitname=jade-jekyll-plugin
pkgver=latest
pkgrel=1
pkgdesc="Brings Jade support to the Jekyll."
arch=(any)
url="https://github.com/snappylabs/jade-jekyll-plugin"
license=('MIT')
depends=('ruby-jekyll')
makedepends=('git')
source=("git+https://github.com/snappylabs/$_gitname.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"

  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  JEKYLL_VER=$(jekyll --version | grep -oe '[0-9]\.[0-9]\.[0-9]')
  RUBY_VER=$(ruby --version | grep -oe '[0-9]\.[0-9]\.[0-9]')

  install -Dm 644 "$srcdir/$_gitname/jade.rb" \
    "$pkgdir/usr/lib/ruby/gems/$RUBY_VER/gems/jekyll-$JEKYLL_VER/lib/jade.rb"
}
