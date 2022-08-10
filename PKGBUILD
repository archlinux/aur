# Author: Kyle Manna <kyle(at)kylemanna(dot)com>
pkgname=aurora-cli
pkgver=0.0.3
pkgrel=1
pkgdesc="Command line tools for interacting with NEAR Protocol"
arch=('x86_64')
url='https://github.com/aurora-is-near/aurora-cli'
license=('custom:CC0-1.0')

depends=('nodejs' 'libusb')
makedepends=('nodejs' 'npm' 'git')

source=("https://github.com/aurora-is-near/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('15241ff15cab4a4f0616536338165ce9b872d6462b0b79f983f08492a329637d')
noextract=("${pkgname}-${pkgver}.tgz")

package() {
    # Reference: https://wiki.archlinux.org/title/Node.js_package_guidelines
    npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgver}.tar.gz"

    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"
}
