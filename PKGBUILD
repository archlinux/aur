# Maintainer: Ward Segers <w@rdsegers.be>

pkgname=wordup-cli
pkgver=0.7.3
pkgrel=1
pkgdesc='open-source toolkit for WordPress Theme/Plugin development'
arch=('any')
url='https://wordup.dev'
license=('GPL3')
depends=('npm' 'docker-compose')
provides=('wordup')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha512sums=('6b312cb5fb8d74ee2913fe5a74c5774eb638b8fb1e8bbdb792e818efe9c585bfdb967f5dc940977ebb1736ca63d035b90aa5a725ef3bb346dfca7aa08aba1b4d')

package() {
    npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tgz

    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/npm/issues/9359 for details.
    find "${pkgdir}"/usr -type d -exec chmod 755 {} +

    # npm gives ownership of ALL FILES to build user 
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "$pkgdir"
}

