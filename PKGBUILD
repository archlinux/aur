# Maintainer: L.G. Sarmiento (Pico) <Luis.Sarmientop-ala-nuclear.lu.se>
pkgname=gitlist-git
_pkgname=gitlist
pkgver=3dd25f3
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
conflicts=('gitlist')
_gitroot="https://github.com/klaussilveira/gitlist.git"

build() {
  [ -d ${srcdir}/${_pkgname} ] || mkdir -p ${srcdir}/${_pkgname}
  cd ${srcdir}/${_pkgname}
  git clone --depth 1 $_gitroot .
}

package() {

  local dstdir="$pkgdir"/usr/share/webapps
  install -d "$dstdir"
  cp -a "$srcdir"/$_pkgname "$dstdir"/$_pkgname
  #mkdir "$dstdir"/$_pkgname/cache
  chmod 777 "$dstdir"/$_pkgname/cache
  install -Dm644 $_pkgname/LICENSE.txt "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
}
