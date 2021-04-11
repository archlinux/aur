# Maintainer: Ward Segers <w@rdsegers.be>

pkgname=wordup-cli
pkgver=1.0.0
pkgrel=1
pkgdesc='open-source toolkit for WordPress Theme/Plugin development'
arch=('any')
url='https://wordup.dev'
license=('GPL3')
depends=('npm' 'docker-compose')
provides=('wordup')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha512sums=('ce3df96fed8fb306804f9032dd8dab4b91a3194c76775012d120e9c7883dbd4d449f1616d4811452607ae70f54be07a953ddfc8d471d2ee073f5e99a209a55ed')

package() {
    npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tgz

    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/npm/issues/9359 for details.
    find "${pkgdir}"/usr -type d -exec chmod 755 {} +

    # npm gives ownership of ALL FILES to build user 
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "$pkgdir"
}

