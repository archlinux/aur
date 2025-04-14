# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Atom Long <atom0815@gmail.com>
pkgname=electron-builder
pkgver=26.0.12
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
sha256sums=('1458adb3d7c531c7aa65529a91ceda8262957d047c8413c2693e574a513ee8a1')
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