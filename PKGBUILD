# Maintainer: Andy Bao <contact@andybao.me>
_pkgname=cinny-web
pkgname="${_pkgname}-git"
pkgver=r853.af69955
pkgrel=1
pkgdesc="Yet another matrix client — web version"
arch=('any')
url="https://github.com/ajbura/cinny"
license=('MIT')
makedepends=('git' 'npm')
source=("${_pkgname}::git+https://github.com/ajbura/cinny.git#branch=dev")
sha256sums=("SKIP")

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  npm install --legacy-peer-deps
  npm run build
}

package() {
  cd "$srcdir/$_pkgname"
  install -d "$pkgdir/usr/share/webapps/cinny"
  cp -r dist/* "$pkgdir/usr/share/webapps/cinny"
  chmod -R 0755 "$pkgdir/usr/share/webapps/cinny"
}
