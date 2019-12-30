# Maintainer: Simon Legner <Simon.Legner@gmail.com>
# Contributor: Marcs <aur (at) mg.odd.red>

pkgname=lerna
pkgver=3.20.1
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

sha256sums=('23c3031a2b8943b6dcc96721d128c1f1f01a8a60087b7dc5506185661d678aa9')
