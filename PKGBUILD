# Maintainer: Kirill Goncharov <kdgoncharov at gmail dot com>
# Contributor:  Devin Cofer <ranguvar[at]ranguvar[dot]io>
# Contributor: Francisco Giordano <frangio.1@gmail.com>
pkgname=truffle
pkgver=5.1.23
pkgrel=1
pkgdesc='A development framework for Ethereum smart contracts'
url='https://github.com/trufflesuite/truffle'
arch=('any')
license=('MIT')
source=("https://registry.npmjs.org/truffle/-/truffle-${pkgver}.tgz")
noextract=("truffle-${pkgver}.tgz")
makedepends=('npm')
depends=('nodejs')
sha256sums=('3e3014b5a6fb49a0f4261ac3fd52685a3ade94bf2eb3de486cf49a25c8019cf4')

package() {
    npm install -g --production --prefix "$pkgdir/usr" "truffle-${pkgver}.tgz"
    tar -xf "truffle-${pkgver}.tgz" package/LICENSE
    install -D -m644 package/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # -> https://wiki.archlinux.org/index.php/Node.js_package_guidelines
    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/npm/issues/9359 for details.
    find "${pkgdir}"/usr -type d -exec chmod 755 {} +
    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "$pkgdir"
}
