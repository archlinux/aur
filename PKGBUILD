# Maintainer: Rui Marques <aur@ruimarques.xyz>
# Contributor: Rui Marques <aur@ruimarques.xyz>

_pkgname=luajit
_reponame=luajit2
pkgname=$_pkgname-openresty-stable
_pkgver=2.1-20210510
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc='Latest stable tag of the openresty luajit fork'
arch=('any')
url="https://github.com/openresty/$_reponame"
license=('MIT')
depends=('gcc-libs')
conflicts=('luajit')
provides=('luajit')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$_pkgver.tar.gz")
sha256sums=('1ee6dad809a5bb22efb45e6dac767f7ce544ad652d353a93d7f26b605f69fe3f')

build() {
  cd "$_reponame-$_pkgver"
  make amalg PREFIX=/usr
}

package() {
  cd "$_reponame-$_pkgver"

  make install DESTDIR="$pkgdir" PREFIX=/usr
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/COPYRIGHT"
}
