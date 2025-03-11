# Maintainer: Radim Sückr <kontakt@radimsuckr.cz>

pkgname=aws-amplify-cli
_npmname='@aws-amplify/cli'
pkgver=12.14.4
pkgrel=1
pkgdesc='The AWS Amplify CLI is a toolchain for simplifying serverless web and mobile development.'
arch=('any')
url='https://docs.amplify.aws/cli/'
license=('Apache License 2.0')
conflicts=()
depends=('nodejs')
makedepends=('npm')
_filename="cli-${pkgver}.tgz"
source=("https://registry.npmjs.org/${_npmname}/-/${_filename}")
sha512sums=('0abbb699758a32d5fec24cfdf2198b87a922c63e7fdb979d5a1924014b78c5d36de5fb0fc5306d8fecfd301c4653ccc0cbde88e09e9d630a9e1534c6b226ffaf')

package() {
    install -Dm644 "${srcdir}/package/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    npm install --cache "${srcdir}/npm-cache" -g --prefix "${pkgdir}/usr" "${srcdir}/${_filename}"

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"
}
