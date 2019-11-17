# Maintainer: Ward Segers <w@rdsegers.be>

pkgname=wordup-cli
pkgver=0.7.0
pkgrel=1
pkgdesc='open-source toolkit for WordPress Theme/Plugin development'
arch=('any')
url='https://wordup.dev'
license=('GPL3')
depends=('npm' 'docker-compose')
provides=('wordup')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha512sums=('b2620908f7123ba98eb087560d0a16e06aaa1976e5b6152de1b8d07e4a6038946eae3e7dee60f0bae7a9bfa9a2b053a19ba42f3792e0aaa0e20c940daf830c2d')

package() {
    npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tgz

    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/npm/issues/9359 for details.
    find "${pkgdir}"/usr -type d -exec chmod 755 {} +

    # npm gives ownership of ALL FILES to build user 
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "$pkgdir"
}

