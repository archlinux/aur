# Maintainer: zen wen <zen.8841@gmail.com>

pkgname=hexo-deployer-git
pkgver=4.0.0
pkgrel=1
pkgdesc="Git deployer plugin for Hexo"
arch=('any')
url="https://www.npmjs.com/package/$pkgname"
license=('MIT')
depends=('nodejs' 'git')
makedepends=('npm')
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
sha256sums=('3a374697e31617e09f89664f42bd495eeb3cdf189f8eb8a6d90f71ad30fb4a21')

package() {
    npm install --global "$srcdir/$pkgname-$pkgver.tgz" \
        --prefix "$pkgdir/usr" \
        --cache "$srcdir/npm-cache"

    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/cli/issues/1103 for details.
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown --recursive root:root "${pkgdir}"
}
