# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>

pkgname=solid-shell
pkgver=1.0.2
pkgrel=1
pkgdesc="A command-line tool, batch processor, and interactive shell for managing Solid data"
arch=(any)
url="https://www.npmjs.com/package/solid-shell"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
md5sums=('4990adac156c8496a250cace3ee21138')
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
