# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=pot-translation
reponame=pot-desktop
pkgver=0.5.1
pkgrel=1
pkgdesc="一个跨平台的划词翻译软件"
arch=('x86_64')
url="https://github.com/pot-app/pot-desktop"
license=('GPL3')
provides=("$pkgname")
conflicts=("$pkgname-bin" "$pkgname-git")
depends=('libappindicator-gtk3' 'webkit2gtk' 'gtk3' 'libayatana-appindicator' 'xdotool')
makedepends=('nodejs' 'pnpm' 'rust')

source=("${reponame}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")

sha512sums=('b60eea16fbccafd7181e876fab281b08c75f12eb8bb2e4714919bf4bbbc692b5e4ad24244324bff03c4fa7c5f1955247052b2d3433ab72cade59683e09b74346')

build(){
    cd $srcdir/${reponame}-${pkgver}
    sed -i "s/\"version\".*/\"version\": \"$pkgver\"/g" src-tauri/tauri.conf.json 
    pnpm i
    pnpm tauri build -b deb
}
package() {
    cd $srcdir/${reponame}-${pkgver}
    tar xpf src-tauri/target/release/bundle/deb/pot_${pkgver}_amd64/data.tar.gz -C ${pkgdir}
}
