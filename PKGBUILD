# Maintainer: rako <m@rako.space>

pkgname=dxfl
_pkgname=dxfl
pkgver=0.3.1
pkgrel=1
pkgdesc="A CLI tool to manage your Deuxfleurs account."
arch=('any')
url="https://www.npmjs.com/package/dxfl"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
sha512sums=('a4315aa014402ed3284252fa1801ba4597d5358785aad7b2c000f7e07036b9c6cff1be94c76079cd1cab659272c839cf2ae67ebf08d9a2e2f8568ea37fec0590')

package() {
  npm install -g --prefix "${pkgdir}/usr" $_pkgname-$pkgver.tgz

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/cli/issues/1103 for details.
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}
