# Maintainer: hexchain <i at hexchain dot org>

pkgname=yaml-language-server
pkgver=0.10.0
pkgrel=1
pkgdesc="Language Server for Yaml Files"
url="https://github.com/redhat-developer/yaml-language-server"
license=('MIT')
arch=('any')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)

package() {
    npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tgz

    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/npm/issues/9359 for details.
    chmod -R u=rwX,go=rX "$pkgdir"

    # npm installs package.json owned by build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "$pkgdir"

    install -d "$pkgdir"/usr/share/licenses/$pkgname
    ln -s ../../../lib/node_modules/$pkgname/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
sha256sums=('57c0ceb7bfe2f50d426bbfdd44824870c8a0499756d56910e461c0789722989b')
