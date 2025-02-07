# Maintainer: Luke Arms <luke@arms.to>

pkgname=babel-preset-env
pkgver=7.26.7
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
sha512sums=('61c836b675f08b16973956f6f6b6a76bc1cd3e02d50687fcaaab4d43d2c4db6228c996e841b192c48e99c9231d5b72b99c07ba82edf921a25e7d425f9615054d'
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
