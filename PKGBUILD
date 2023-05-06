# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=pot-translation
prjname=pot
pkgver=0.2.4
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

sha512sums=('cfa5da1e38cfcd5ae4d779e17e22fccef7aa5fe0dd318758dadb22d75e1fd8e0a2568ec4063e6c0ea306e9d3b5162fbfd6cfbf085bb78f3e1165df8cb636ff42')

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
