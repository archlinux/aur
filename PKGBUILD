# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=pot-translation
reponame=pot-desktop
pkgver=1.13.0
pkgrel=1
pkgdesc="一个跨平台的划词翻译软件"
arch=('any')
url="https://github.com/pot-app/pot-desktop"
license=('GPL3')
provides=("$pkgname")
conflicts=("$pkgname-bin" "$pkgname-git")
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator' 'xdotool' 'libxcb' 'libxrandr' 'tesseract' 'tessdata')
makedepends=('nodejs' 'pnpm' 'rust' 'git' 'dbus')

source=("${reponame}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")

sha512sums=('61cb57e535bde1e198a3971d471e639610d89fe61876f5b590aa921f5b44a52ae7c7ba9cc1872e277cc825a5dd49ccbedf4ba620edefdfaac3967865afa3ebec')

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
