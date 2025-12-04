# Maintainer: honjow
pkgname=sk-chos-tool
_reponame=sk-chos-config
pkgver=3.1.1
_addonver=2.16.1
pkgrel=1
pkgdesc="A custom configs tool for sk-chimeros"
arch=('any')
url="https://github.com/honjow/sk-chos-config.git"
license=('MIT')
makedepends=('git')
depends=('python-gobject' 'gtk3' 'sk-chos-addon')
provides=(sk-chos-tool)
conflicts=(sk-chos-tool-git)
replaces=(sk-chos-tool-git)
source=(
    "$pkgname-${_addonver}.tar.gz::https://github.com/honjow/sk-chos-config/archive/refs/tags/v${_addonver}.tar.gz"
    "$pkgname-${pkgver}.AppImage::https://github.com/honjow/sk-chos-tool/releases/download/v${pkgver}/sk_chos_tool-latest-x86_64.AppImage"
    )
sha256sums=(
    'SKIP'
    'SKIP'
    )
options=(!strip)
install=sk-chos-tool.install

package() {
    source_dir="${srcdir}/${_reponame}-${_addonver}/src/chimeraos"
    install -dm755 "${pkgdir}/usr/share/${pkgname}"

    # icon
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    install -m644 -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps" "${source_dir}/icon"/*.svg

    # 主程序
    install -dm755 "${pkgdir}/usr/share/${pkgname}/pages"
    install -dm755 "${pkgdir}/usr/share/${pkgname}/scripts"
    install -m755 -t "${pkgdir}/usr/share/${pkgname}/pages" "${source_dir}/main/pages"/*
    install -m755 -t "${pkgdir}/usr/share/${pkgname}" "${source_dir}/main"/*.*
    install -m755 -t "${pkgdir}/usr/share/${pkgname}/scripts" "${source_dir}/main/scripts"/*.*

    # AppImage
    install -Dm755 "${srcdir}/$pkgname-${pkgver}.AppImage" "${pkgdir}/usr/share/${pkgname}/sk-chos-tool.AppImage"

    # 主程序入口
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/usr/share/${pkgname}/sk-chos-tool.py" "${pkgdir}/usr/bin/sk-chos-tool-py"
    install -Dm755 "${source_dir}/bin/sk-chos-tool-command" "${pkgdir}/usr/bin/sk-chos-tool-command"

    ln -s "/usr/share/${pkgname}/sk-chos-tool.AppImage" "${pkgdir}/usr/bin/sk-chos-tool"

    # 程序图标
    # install -Dm644 "${source_dir}/sk-chos-tool-command.desktop" "${pkgdir}/usr/share/applications/sk-chos-tool-command.desktop"
    install -Dm644 "${source_dir}/sk-chos-tool.desktop" "${pkgdir}/usr/share/applications/sk-chos-tool.desktop"

}
