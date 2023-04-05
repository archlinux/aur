# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=pot-translation
prjname=pot
pkgver=0.1.12
pkgrel=0
pkgdesc="一个跨平台的划词翻译软件"
arch=('x86_64')
url="https://github.com/Pylogmon/pot"
license=('GPL3')
provides=("$pkgname")
conflicts=("$pkgname-bin" "$pkgname-git")
depends=('libappindicator-gtk3' 'webkit2gtk' 'gtk3' 'libayatana-appindicator')
makedepends=('nodejs' 'pnpm' 'rust')

source=("${prjname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")

sha512sums=('b9d0a2eef604831b8a5cb43ef4164045042014f2d5ad23276ca492d270e8446dd35c398516ad0f226028dbde338248d40a503ca35b0731d0e04dfb5e343cdaff')

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
