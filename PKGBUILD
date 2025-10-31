# Maintainer: Luke Arms <luke@arms.to>

pkgname=babel-preset-env
pkgver=7.28.5
pkgrel=1
pkgdesc="A Babel preset for each environment."
arch=('any')
url="https://babel.dev/docs/en/next/babel-preset-env"
license=('MIT')
depends=('nodejs' 'babel-core' 'semver')
makedepends=('npm')
provides=('nodejs-babel-preset-env')
conflicts=('nodejs-babel-preset-env')
replaces=('nodejs-babel-preset-env')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/@babel/preset-env/-/preset-env-$pkgver.tgz"
    LICENSE)
noextract=($pkgname-$pkgver.tgz)
sha512sums=('4b7ea63a88b549be85cfdf1f05f13e5194a9630e66266d0d507b482ab3ae35ca9e15abb2d49e9d22f5e6d8a4552a86ce49a1aae2dfe105774de07194df02fd5a'
            '29844c3773154ee8b2e579050c77793e74261da427b77cf5ea7b010de3f167d60d9aaec8165b25a41065477508fb3be56c47a6ce8c0e61e2a297d6b4664398c5')

package() {
    npm install -g --legacy-peer-deps --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tgz
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    rm -r "$pkgdir"/usr/lib/node_modules/@babel/preset-env/node_modules/{,.bin/}semver

    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/npm/issues/9359 for details.
    chmod -R u=rwX,go=rX "$pkgdir"

    # npm installs package.json owned by build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "$pkgdir"
}
