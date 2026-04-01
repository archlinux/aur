# Maintainer: Zeta <3380089537@qq.com>
pkgname=zetapm
pkgver=1.0.0
pkgrel=1
pkgdesc="Zeta Package Manager - 一个多功能包管理器，支持 AUR、Debian 包转换和 APT 源"
arch=('any')
url="https://github.com/ZhongHongSoftware/zpm"
license=('GPL3')
depends=('bash' 'curl' 'jq' 'git' 'pacman' 'tar' 'gzip' 'python3')
optdepends=('devtools: 用于在 clean chroot 中构建'
            'namcap: 用于检查 PKGBUILD')
source=("${pkgname}-${pkgver}.tar.gz")
sha256sums=(SKIP)

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # 安装主程序
    install -Dm755 bin/zpm "${pkgdir}/usr/bin/zpm"

    # 安装库文件
    install -dm755 "${pkgdir}/usr/lib/zpm/sh"
    install -dm755 "${pkgdir}/usr/lib/zpm/python"

    for file in lib/sh/*.sh; do
        install -Dm644 "$file" "${pkgdir}/usr/lib/zpm/sh/"
    done

    for file in lib/python/*.py; do
        install -Dm755 "$file" "${pkgdir}/usr/lib/zpm/python/"
    done

    # 安装配置文件
    install -Dm644 config/zpm.conf "${pkgdir}/etc/zpm/zpm.conf"

    # 安装文档
    install -Dm644 docs/README.md "${pkgdir}/usr/share/doc/zpm/README.md"

    # 安装许可证
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/zpm/LICENSE" 2>/dev/null || true
}
