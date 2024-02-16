# Maintainer: honjow
pkgname=sk-chos-tool-git
_pkgname=sk-chos-tool
pkgver=r331.590a8c9
pkgrel=1
pkgdesc="A custom configs tool for sk-chimeros"
arch=('any')
url="https://github.com/honjow/sk-holoiso-config.git"
license=('MIT')
makedepends=('git')
depends=('python-gobject' 'gtk3' 'sk-chos-addon-git')
provides=(sk-chos-tool)
conflicts=(sk-chos-tool)
replaces=(sk-chos-tool)
source=("git+$url")
sha256sums=('SKIP')
options=(!strip)
install=sk-chos-tool.install

pkgver() {
    cd "$srcdir/sk-holoiso-config"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    source_dir="${srcdir}/sk-holoiso-config/src/chimeraos"
    install -dm755 "${pkgdir}/usr/share/${_pkgname}"

    # icon
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    install -m644 -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps" "${source_dir}/icon"/*.svg

    # 主程序
    install -dm755 "${pkgdir}/usr/share/${_pkgname}/pages"
    install -dm755 "${pkgdir}/usr/share/${_pkgname}/scripts"
    install -m755 -t "${pkgdir}/usr/share/${_pkgname}/pages" "${source_dir}/main/pages"/*
    install -m755 -t "${pkgdir}/usr/share/${_pkgname}" "${source_dir}/main"/*.*
    install -m755 -t "${pkgdir}/usr/share/${_pkgname}/scripts" "${source_dir}/main/scripts"/*.*

    # 主程序入口
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/usr/share/${_pkgname}/sk-chos-tool.py" "${pkgdir}/usr/bin/sk-chos-tool"

    # 程序图标
    install -Dm644 "${source_dir}/sk-chos-tool-command.desktop" "${pkgdir}/usr/share/applications/sk-chos-tool-command.desktop"
    install -Dm644 "${source_dir}/sk-chos-tool.desktop" "${pkgdir}/usr/share/applications/sk-chos-tool.desktop"

}
