# Maintainer: Micha Alt <micha.tucker@gmail.com> 
# Contributor: FadeMind <fademind@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Tom Vincent <http://tlvince.com/contact>

_npmname=bower
pkgname=nodejs-$_npmname
pkgver=1.5.2
pkgrel=2
pkgdesc='A package manager for the web'
arch=('any')
url='http://bower.io/'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz
        LICENSE)
noextract=($_npmname-$pkgver.tgz)
md5sums=('218d35f4106d00d27c8f4930fdd64547'
         '135697567327f92e904ef0be2082da5e')

package() {
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver

  rmdir "${pkgdir}/usr/etc"
}

