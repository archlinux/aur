# Author: Kyle Manna <kyle(at)kylemanna(dot)com>
pkgname=near-cli
pkgver=3.3.1
pkgrel=1
pkgdesc="Command line tools for interacting with NEAR Protocol"
arch=('x86_64')
url='https://github.com/near/near-cli'
license=('MIT' 'Apache')

depends=('nodejs' 'libusb')
makedepends=('nodejs' 'npm')

source=("https://github.com/near/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2fb18803f84eb5c99f3ab4922bd85e5de775ebba2e021c8803fcffbeb5b87ab5')
noextract=("${pkgname}-${pkgver}.tgz")

package() {
    # Reference: https://wiki.archlinux.org/title/Node.js_package_guidelines
    npm install -g --prefix "${pkgdir}/usr" "${srcdir}/v${pkgver}.tar.gz"

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"
}
