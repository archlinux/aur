# Maintainer: Serverbread <serverbread-DEV@qq.com>

pkgname='liteloader-qqnt-llonebot-git'
_pkgname='LiteLoaderQQNT-LLOneBot'
pkgver='3.29.6_4ea0267'
pkgrel=1
pkgdesc="使你的NTQQ支持OneBot11协议进行QQ机器人开发"
arch=('any')
url="https://github.com/LLOneBot/LLOneBot"
license=("MIT")
depends=("liteloader-qqnt")
makedepends=("npm")
provides=("liteloader-qqnt-llonebot")
conflicts=("liteloader-qqnt-llonebot")

source=("git+${url}.git")
sha256sums=('SKIP')

prepare() {
    cd $srcdir/LLOneBot/
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    npm install
}

build() {
    cd $srcdir/LLOneBot
    npm run build
    cp manifest.json ./dist/manifest.json
}

package() {
    mkdir -p "${pkgdir}/opt/LiteLoaderQQNT/plugins"
    chmod -R 0777 "${pkgdir}/opt/LiteLoaderQQNT"
    cp -rf "${srcdir}/LLOneBot/dist" "${pkgdir}/opt/LiteLoaderQQNT/plugins/${_pkgname}"
}
