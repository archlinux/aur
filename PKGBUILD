# Author: Kyle Manna <kyle(at)kylemanna(dot)com>
pkgname=celocli
pkgver=3.0.1
pkgrel=1
pkgdesc="Tool for interacting with the Celo Protocol"
arch=('x86_64')
url='https://github.com/celo-org/celo-monorepo'
license=('Apache')

depends=('nodejs' 'libusb')
makedepends=('nodejs-lts-hydrogen' 'npm' 'git')

source=("https://registry.npmjs.org/@celo/$pkgname/-/$pkgname-$pkgver.tgz")
sha256sums=('72c3a886bcc3fbe88a25d82a3f23b7fda99703051623cc51e423be5d6d4a6ac8')
noextract=("${pkgname}-${pkgver}.tgz")

package() {
    # Reference: https://wiki.archlinux.org/title/Node.js_package_guidelines
    npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"
}
