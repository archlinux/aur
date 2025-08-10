# Maintainer: qwjyh <urataw421 at gmail dot com>

pkgname=opcua-commander
_pkgname=$pkgname
pkgver=0.40.0
pkgrel=1
pkgdesc="a opcua client with blessed (ncurses)"
depends=('nodejs')
makedepends=('npm')
arch=('any')
url="https://github.com/node-opcua/opcua-commander#readme"
license=('MIT')
source=("https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
sha256sums=('e91ec2bc955ea56d5f2ee047937bf818bac1e3ed987476585577c2912ff6e4bd')

package() {
    npm install "${srcdir}/${_pkgname}-${pkgver}.tgz" -g --prefix "${pkgdir}/usr" --cache "${srcdir}/npm-cache"

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"

    find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

    install -Dm644 "$srcdir/package/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
