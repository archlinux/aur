# Maintainer: Radim Sückr <kontakt@radimsuckr.cz>

pkgname=aws-amplify-cli
_npmname='@aws-amplify/cli'
pkgver=9.2.1
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
sha512sums=('12aa72445c94106a15fc0e370e98dd7d22a541f597049ec14d8d6ba049c66e47b434420075373e7542c94d13f335dcd1b94e4296ec90a782a39c316b16f4e522')

package() {
    install -Dm644 "${srcdir}/package/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    npm install --cache "${srcdir}/npm-cache" -g --prefix "${pkgdir}/usr" "${srcdir}/${_filename}"

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"
}
