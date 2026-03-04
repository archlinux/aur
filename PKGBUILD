# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Atom Long <atom0815@gmail.com>
pkgname=electron-builder
pkgver=26.8.1
# 可以通过 npm search electron-builder来确定版本
pkgrel=1
pkgdesc="A complete solution to package and build a ready for distribution Electron app with “auto update” support out of the box"
arch=(any)
url="https://www.electron.build/"
license=('MIT')
depends=(
    'nodejs'
    'python'
    'python-setuptools'
)
makedepends=(
    'npm'
)
options=(
    '!strip'
)
source=("${pkgname}-${pkgver}.tgz::http://registry.npmmirror.com/${pkgname}/-/${pkgname#nodejs-}-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('e44ebd6e310ff8b20bc0604f0a22043341134fa95cf4ee82f2025c51a31eaa04')
package() {
    HOME="${srcdir}/.electron-gyp"
    {
        echo -e '\n'
        #echo 'build_from_source=true'
        echo "cache=${srcdir}/.npm_cache"
    } >> npmrc
    npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
    find "${pkgdir}"/usr -type d -exec chmod 755 {} +
    install -Dm644 "${pkgdir}/usr/lib/node_modules/${pkgname#nodejs-}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
