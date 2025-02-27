# Maintainer: Julius de Bruijn <julius@nauk.io>
pkgname=graphqurl
pkgver=2.0.0
pkgrel=1
pkgdesc="curl like CLI for GraphQL - with autocomplete and subscriptions support"
arch=('any')
url="https://github.com/hasura/graphqurl"
license=('Apache')
depends=('nodejs' 'npm')
makedepends=('npm')
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
sha256sums=('589fd91ec8b40554ff2d32a35846bc9e31466ce9824530ccd3176aafe8e8ce75')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  # Fix permissions
  find "$pkgdir/usr" -type d -exec chmod 755 {} +
  find "$pkgdir/usr" -type f -exec chmod 644 {} +

  # Make binary executable
  chmod 755 "$pkgdir/usr/bin/gq"

  # Remove references to $pkgdir
  find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "s|$pkgdir||g"
}
