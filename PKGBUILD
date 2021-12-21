# Author: Kyle Manna <kyle(at)kylemanna(dot)com>
pkgname=celocli
pkgver=1.5.0
pkgrel=1
pkgdesc="Tool for interacting with the Celo Protocol"
arch=('x86_64')
url='https://github.com/celo-org/celo-monorepo'
license=('Apache')

depends=('nodejs' 'libusb')
# Docs say node.js v12 is supported and building with node.js v17 fails with a C++17 compilation error:
# npm ERR! ../src/HID.cc:67:5: error: ISO C++17 does not allow dynamic exception specifications             
# npm ERR!    67 |     throw(JSException);                                                                  
# npm ERR!       |     ^~~~~                                                                                
# https://docs.celo.org/command-line-interface/introduction
makedepends=('nodejs-lts-erbium' 'npm' 'git')

source=("https://registry.npmjs.org/@celo/$pkgname/-/$pkgname-$pkgver.tgz")
sha256sums=('def6c2f84f534a8b02084f53e9743f32f8ebb352f7db19c321b5a9b413856de4')
noextract=("${pkgname}-${pkgver}.tgz")

package() {
    # Reference: https://wiki.archlinux.org/title/Node.js_package_guidelines
    npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"
}
