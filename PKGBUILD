# Maintainer: honjow
pkgname=sk-chos-tool
pkgver=r141.452dae5
pkgrel=1
pkgdesc="A custom configs tool for sk-chimeros"
arch=('any')
url="https://github.com/honjow/sk-holoiso-config"
license=('MIT')
makedepends=('git')
depends=('python-gobject' 'gtk3' 'openssl')
provides=(sk-chos-tool)
conflicts=(sk-chos-tool)
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
    install -dm755 "${pkgdir}/usr/share/${pkgname}"

    install -dm755 "${pkgdir}/usr/bin/"
    # install -m755 -t "${pkgdir}/usr/bin/" "${source_dir}/usr/bin"/*

    # 主程序
    install -dm755 "${pkgdir}/usr/share/${pkgname}/pages"
    install -m755 -t "${pkgdir}/usr/share/${pkgname}/pages" "${source_dir}/main/pages"/*
    install -m755 -t "${pkgdir}/usr/share/${pkgname}" "${source_dir}/main"/*.*


    # 主程序入口
    ln -s "/usr/share/${pkgname}/sk-chos-tool.py" "${pkgdir}/usr/bin/sk-chos-tool"


    # 程序图标
    install -Dm644 "${source_dir}/sk-chos-tool-command.desktop" "${pkgdir}/usr/share/applications/sk-chos-tool-command.desktop"
    install -Dm644 "${source_dir}/sk-chos-tool.desktop" "${pkgdir}/usr/share/applications/sk-chos-tool.desktop"

}
