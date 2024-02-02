# Maintainer: L.G. Sarmiento (Pico) <Luis.Sarmientop-ala-nuclear.lu.se>
pkgname=gitlist-git
_pkgname=gitlist
pkgver=r713.30d69a6
pkgrel=1
pkgdesc="An elegant and modern git repository viewer."
arch=('any')
url="http://gitlist.org/"
license=('BSD')
depends=('git' 'php')
optdepends=('apache: Web server to run GitList'
            'lighttpd: Web server to run GitList'
            'nginx: Lightweight Web server to run GitList')

provides=('gitlist')

source=($_pkgname::git+https://github.com/klaussilveira/gitlist.git)
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/$_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {

  local dstdir="$pkgdir"/usr/share/webapps
  install -d "$dstdir"
  cp -a "$srcdir"/$_pkgname "$dstdir"/$_pkgname
  #mkdir "$dstdir"/$_pkgname/cache
  #chmod 777 "$dstdir"/$_pkgname/cache
  install -Dm644 $_pkgname/LICENSE ${pkgdir}/usr/share/licenses/$_pkgname/LICENSE
}
