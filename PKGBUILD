# Maintainer: Radim Sückr <kontakt@radimsuckr.cz>

pkgname=aws-amplify-cli
_npmname='@aws-amplify/cli'
pkgver=8.0.2
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
sha512sums=('700b1276a972187018bdb1dc9910035a1704112539af0c1cf11f5ed0ed83b3ac5e5046f8a5d9693bbb3870a2ce972a2c2bcb33767cb61af23ef75667ce6280f1')

package() {
    install -Dm644 "${srcdir}/package/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    npm install --cache "${srcdir}/npm-cache" -g --prefix "${pkgdir}/usr" "${srcdir}/${_filename}"

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"
}
