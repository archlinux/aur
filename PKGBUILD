# Maintainer: rako <m@rako.space>

pkgname=dxfl
_pkgname=dxfl
pkgver=0.6.0
pkgrel=1
pkgdesc="A CLI tool to manage your Deuxfleurs account."
arch=('any')
url="https://www.npmjs.com/package/dxfl"
license=('EUPL')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
sha512sums=('a7c18400c3bea8b011c71f1389169a75759f86db4dc4ff29579281991e104881b9e848daa6f25616151b875100b567bdcb28f10c1154a7957e27ddd35b4eaae8')

package() {
  npm install -g --prefix "${pkgdir}/usr" $_pkgname-$pkgver.tgz

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/cli/issues/1103 for details.
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}
