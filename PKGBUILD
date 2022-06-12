# Maintainer: Radim Sückr <kontakt@radimsuckr.cz>

pkgname=aws-amplify-cli
_npmname='@aws-amplify/cli'
pkgver=8.4.0
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
sha512sums=('246bf1d6358d89f525497d2e57c7ae161717e1d23adcc76732f42c51fb317fd251f93ca40cb5e51bc559ec52665802147d2dd358c3399267457759f8a43aeb8e')

package() {
    install -Dm644 "${srcdir}/package/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    npm install --cache "${srcdir}/npm-cache" -g --prefix "${pkgdir}/usr" "${srcdir}/${_filename}"

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"
}
