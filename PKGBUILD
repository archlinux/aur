# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=pot-translation
prjname=pot
pkgver=0.0.2
pkgrel=0
pkgdesc="一个跨平台的划词翻译软件"
arch=('x86_64')
url="https://github.com/Pylogmon/pot"
license=('GPL3')
depends=('libappindicator-gtk3' 'webkit2gtk' 'gtk3' 'libayatana-appindicator' 'xsel')
makedepends=('nodejs' 'pnpm' 'rust')

source=("${prjname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")

sha512sums=('4c3882f3e7f313f1e5b56d915e231b19f8bfe66993a1647a7ac8c5fbb7bce080e34b6f3465f26065231c0e60ae6bd092782313e565ac43eac8a67f7494cc72e3')

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
