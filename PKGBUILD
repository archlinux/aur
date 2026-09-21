# Maintainer: duanluan <duanluan@outlook.com>
# ZCode Pro — ZCode 桌面版界面增强（不修改 app.asar）
# 依赖 AUR 的 zcode 包提供 ZCode 桌面版本体。

pkgname=zcode-pro
pkgver=0.5.0
pkgrel=2
pkgdesc="ZCode Pro — 界面增强启动器（自定义项目别名等），不修改官方应用文件"
arch=(any)
license=(Apache)
url="https://github.com/duanluan/zcode-pro"
depends=('zcode')
optdepends=('nodejs>=22: 使用系统 Node 运行启动器（缺省复用 ZCode 内置运行时，无需安装 Node）')
makedepends=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('5a1f5f1eeb4b4c72aaee5b1cd478a9df244fb76ad7e5ecd27d419a5e665497d8')
options=('!strip')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 bin/zcode-pro        "${pkgdir}/usr/lib/${pkgname}/bin/zcode-pro"
  install -Dm644 cli.mjs              "${pkgdir}/usr/lib/${pkgname}/cli.mjs"
  install -Dm644 dist/inject.js       "${pkgdir}/usr/lib/${pkgname}/dist/inject.js"
  install -Dm644 src/host/*.mjs       -t "${pkgdir}/usr/lib/${pkgname}/src/host/"
  install -Dm644 LICENSE              "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${pkgname}/bin/zcode-pro" "${pkgdir}/usr/bin/zcode-pro"
  # 应用菜单快捷方式「ZCode Pro」（图标复用 zcode 包的 Icon=zcode）
  install -Dm644 packaging/zcode-pro.desktop "${pkgdir}/usr/share/applications/zcode-pro.desktop"
  sed -i 's|@bindir@|/usr/bin|' "${pkgdir}/usr/share/applications/zcode-pro.desktop"
  # Linux 下 zcode-pro 会自动探测 /opt/ZCode/zcode（AUR zcode 包安装位置）
}
