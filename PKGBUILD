# Maintainer: fr0stb1rd <fr0stb1rd@proton.me>
pkgname=jadx-bin
pkgver=1.5.6
pkgrel=1
pkgdesc='Command line and GUI tools to produce Java source code from Android Dex and APK files (binary release)'
arch=('any')
url='https://github.com/skylot/jadx'
license=('Apache-2.0')

depends=('java-runtime>=11' 'sh')

provides=("jadx=${pkgver}" "jadx-gui=${pkgver}")
conflicts=('jadx' 'jadx-git')

source=("https://github.com/skylot/jadx/releases/download/v${pkgver}/jadx-${pkgver}.zip"
        "https://raw.githubusercontent.com/skylot/jadx/v${pkgver}/contrib/jadx-gui.desktop"
        "https://raw.githubusercontent.com/skylot/jadx/v${pkgver}/jadx-gui/src/main/resources/logos/jadx-logo.svg"
        "https://raw.githubusercontent.com/skylot/jadx/v${pkgver}/jadx-gui/src/main/resources/logos/jadx-logo-16px.png"
        "https://raw.githubusercontent.com/skylot/jadx/v${pkgver}/jadx-gui/src/main/resources/logos/jadx-logo-32px.png"
        "https://raw.githubusercontent.com/skylot/jadx/v${pkgver}/jadx-gui/src/main/resources/logos/jadx-logo-48px.png")
sha512sums=('4f556d2d9c2da120c898c928b84d2615f6199efdbbedd813bd84c5654a3f7e97dfab1e4be511121e1155e9b6a9355c6a4abe09bdbba9a58db1e79449f0cf4a26'
            '0e5a2cd618cbd2e058038650e6e8628c7ca810509a01ad6cbc8d9c7a4da2d9e290d7188ab4f45148120c2d4f3ea36c7dd916aa9b1ace54ff8e151ed2aad15967'
            '29f6ea7accc304bbf41bed657c9db5356a99b042dbaac94d6fa6a8e9d783ee27950dd19742de447516edf4aadf5215257050f9e089ea4d7aad3fef2f5f0c3132'
            '0641cc5afb326c985f02ca42206c4a6be393cd5e4fa0e6c84f47341fda54aea32a0ae10363628dcb9852f58cc19255307651611ba074b90b87b7b49327ce91f0'
            '0aea2ecdb1931eb1f5260041de98ea5fc1a8272530c787b9a80f35dd61626c9b6b7245283dbac555cc2f7228db946783f8402867c2d02387a8f14bcf9220aee4'
            '86f0fde07a308584bbe68f2d285db1510109552e62b3dbf5732396b33479200b469cc457f08baf7866b529d74ad017710f63285dd0eeba2d76de10ee561c4702')

package() {
  install -Dm 755 bin/jadx bin/jadx-gui -t "${pkgdir}/usr/share/java/${pkgname}/bin"
  install -Dm 644 lib/* -t "${pkgdir}/usr/share/java/${pkgname}/lib"

  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/java/${pkgname}/bin/jadx" "${pkgdir}/usr/bin/jadx"
  ln -s "/usr/share/java/${pkgname}/bin/jadx-gui" "${pkgdir}/usr/bin/jadx-gui"

  install -Dm 644 jadx-gui.desktop -t "${pkgdir}/usr/share/applications"
  install -Dm 644 jadx-logo.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/jadx.svg"

  for res in 16 32 48; do
    install -Dm644 "jadx-logo-${res}px.png" \
      "${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps/jadx.png"
  done

  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
