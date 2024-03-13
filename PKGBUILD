# Maintainer: honjow
pkgname=sk-chos-tool
_reponame=sk-holoiso-config
pkgver=1.2.0
pkgrel=1
pkgdesc="A custom configs tool for sk-chimeros"
arch=('any')
url="https://github.com/honjow/sk-holoiso-config.git"
license=('MIT')
makedepends=('git')
depends=('python-gobject' 'gtk3' 'sk-chos-addon')
provides=(sk-chos-tool)
conflicts=(sk-chos-tool-git)
replaces=(sk-chos-tool-git)
source=("$pkgname-$pkgver.tar.gz::https://github.com/honjow/sk-holoiso-config/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')
options=(!strip)
install=sk-chos-tool.install

package() {
    source_dir="${srcdir}/${_reponame}-${pkgver}/src/chimeraos"
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

    # 主程序入口
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/usr/share/${pkgname}/sk-chos-tool.py" "${pkgdir}/usr/bin/sk-chos-tool"
    install -Dm755 "${source_dir}/bin/sk-chos-tool-command" "${pkgdir}/usr/bin/sk-chos-tool-command"

    # 程序图标
    install -Dm644 "${source_dir}/sk-chos-tool-command.desktop" "${pkgdir}/usr/share/applications/sk-chos-tool-command.desktop"
    install -Dm644 "${source_dir}/sk-chos-tool.desktop" "${pkgdir}/usr/share/applications/sk-chos-tool.desktop"

}
