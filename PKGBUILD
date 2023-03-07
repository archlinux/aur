# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=pot-translation
prjname=pot
pkgver=0.0.4
pkgrel=0
pkgdesc="一个跨平台的划词翻译软件"
arch=('x86_64')
url="https://github.com/Pylogmon/pot"
license=('GPL3')
depends=('libappindicator-gtk3' 'webkit2gtk' 'gtk3' 'libayatana-appindicator' 'xsel')
makedepends=('nodejs' 'pnpm' 'rust')

source=("${prjname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")

sha512sums=('bd7eb2b7d1984eff247149929e881dba83c8ae2d6f296da04c77a2a4f1db2a6f1390d88520718f1e22e06c55439c8d4a11796d5fbf395def6153dd3cfa98f4a4')

build(){
    cd $srcdir/${prjname}-${pkgver}
    sed -i "s/\"version\".*/\"version\": \"$pkgver\"/g" src-tauri/tauri.conf.json 
    pnpm i
    pnpm tauri build -b deb
}
package() {
    cd $srcdir/${prjname}-${pkgver}
    tar xpf src-tauri/target/release/bundle/deb/${prjname}_${pkgver}_amd64/data.tar.gz -C ${pkgdir}
}
