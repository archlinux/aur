# Maintainer: Simon Legner <Simon.Legner@gmail.com>
# Contributor: Marcs <aur (at) mg.odd.red>

pkgname=lerna
pkgver=3.18.3
pkgrel=1
pkgdesc="Tool for managing JavaScript projects with multiple packages"
arch=(any)
url="https://github.com/sebmck/lerna#readme"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
options=(!strip)

package() {
  cd ${srcdir}
  local _npmdir="${pkgdir}/usr/lib/node_modules/"
  mkdir -p ${_npmdir}
  cd ${_npmdir}
  npm install -g --prefix "${pkgdir}/usr" ${pkgname}@${pkgver}
  find "${pkgdir}"/usr -name package.json -exec sed -i '/"_where"/d' '{}' '+'
  find "${pkgdir}"/usr -type d -exec chmod 755 {} +
}

sha256sums=('58e62ee6462c9ab3e13d4d85f953835c5260bab11cfb87186c54b2dbab6f57e2')
