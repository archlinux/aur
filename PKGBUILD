# Maintainer: fr0stb1rd <fr0stb1rd at proton dot me>
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
        "https://raw.githubusercontent.com/skylot/jadx/v${pkgver}/contrib/jadx-gui.desktop")
sha512sums=('4f556d2d9c2da120c898c928b84d2615f6199efdbbedd813bd84c5654a3f7e97dfab1e4be511121e1155e9b6a9355c6a4abe09bdbba9a58db1e79449f0cf4a26'
            '0e5a2cd618cbd2e058038650e6e8628c7ca810509a01ad6cbc8d9c7a4da2d9e290d7188ab4f45148120c2d4f3ea36c7dd916aa9b1ace54ff8e151ed2aad15967')

package() {
  install -Dm 755 bin/jadx bin/jadx-gui -t "${pkgdir}/usr/share/java/${pkgname}/bin"
  install -Dm 644 lib/* -t "${pkgdir}/usr/share/java/${pkgname}/lib"

  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/java/${pkgname}/bin/jadx" "${pkgdir}/usr/bin/jadx"
  ln -s "/usr/share/java/${pkgname}/bin/jadx-gui" "${pkgdir}/usr/bin/jadx-gui"

  install -Dm 644 jadx-gui.desktop -t "${pkgdir}/usr/share/applications"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
