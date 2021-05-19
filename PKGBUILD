# Maintainer: Cedric Girard <cgirard [dot] archlinux [at] valinor [dot] fr>

pkgname=nodejs-csso
pkgver=4.2.0
pkgrel=2
pkgdesc="CSS minifier with structural optimisations"
arch=('any')
url="https://github.com/css/csso"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/csso/-/csso-$pkgver.tgz")
sha256sums=('4b9b8c96cb4082224fec97d9050c48b1877bd03fab6332b2cb4b649b0f71f948')

package() {
    npm install -g --prefix "$pkgdir"/usr "$srcdir"/csso-$pkgver.tgz

    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/npm/issues/9359 for details.
    chmod -R u=rwX,go=rX "$pkgdir"

    # npm installs package.json owned by build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "$pkgdir"
}
