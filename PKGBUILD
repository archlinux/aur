# Maintainer: Radim Sückr <kontakt@radimsuckr.cz>

pkgname=aws-amplify-cli
_npmname='@aws-amplify/cli'
pkgver=8.0.3
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
sha512sums=('93ea4315fa194c459dd6395e663c99bb230e1a0abb1967a5eeb88b5f1dc7613027af789fd00d11ba3adc29fb031bd7302b34a0ffe5df8c109a0a69075ca6a02b')

package() {
    install -Dm644 "${srcdir}/package/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    npm install --cache "${srcdir}/npm-cache" -g --prefix "${pkgdir}/usr" "${srcdir}/${_filename}"

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"
}
