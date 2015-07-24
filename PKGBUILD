# Maintainer: frames <markkuehn at outlook dot com>

pkgname=firefox-extension-ublock-gorhill-git
pkgver=r2471.416c7b4
pkgrel=1
pkgdesc='Feature-Complete version of UBlock as maintained by gorhill, 
git version.'
url='https://github.com/gorhill/uBlock'
arch=('any')
license=('GPL')
depends=('firefox' 'git')
makedepends=('python')
source=("$pkgname::git+https://github.com/gorhill/uBlock.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse 
--short HEAD)"
}

build() {
    cd "$srcdir/$pkgname"
    sh tools/make-firefox.sh
}

package() {
  cd "$srcdir/$pkgname/dist/build/uBlock0.firefox"

  local version="$(grep -Pom1 '(?<=<id>).*(?=</id>)' install.rdf)"

  local dstdir="$pkgdir/usr/lib/firefox/browser/extensions/$version"
  install -d $dstdir
  cp -dpr --no-preserve=ownership * $dstdir
  chmod -R 755 $dstdir
}

