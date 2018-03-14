# Maintainer: Mario Finelli <mario at finel dot li>

_npmname=wintersmith
pkgname=nodejs-$_npmname
pkgver=2.4.1
pkgrel=1
pkgdesc="A flexible static site generator."
arch=('any')
url="https://wintersmith.io"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('d6c6116cf36550c4f691c40258e68ab006a357c6afe9e29fa774adad7e5c2267')

package() {
    npm install -g --production --user root --prefix "$pkgdir/usr" "$_npmname-$pkgver.tgz"
    rm -r "$pkgdir/usr/etc/"

    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/npm/issues/9359 for details.
    find "${pkgdir}"/usr -type d -exec chmod 755 {} +
}

