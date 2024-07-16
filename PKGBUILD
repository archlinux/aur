# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=clash-verge-rev
pkgver=1.7.5
pkgrel=1
pkgdesc="Continuation of Clash Verge | A Clash Meta GUI based on Tauri"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/clash-verge-rev/clash-verge-rev"
license=('GPL3')
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator')
conflicts=("$pkgname-bin" "$pkgname-alpha" "$pkgname-alpha-bin" "$pkgname-git" "clash-verge" "clash-verge-bin")
makedepends=('nodejs' 'pnpm' 'rust')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")

sha512sums=('974ddad57b339c9c7399d65ef40fff4e26c01396f88c43ddb3640526e9414f36591183f11e521f2289166ddbee3e81a21d97a3cdf1118a9fcd7977f7a49bf4bb')
options=('!lto')

prepare(){
    cd $srcdir/${pkgname}-${pkgver}
    pnpm install
    pnpm check
}

build(){
    cd $srcdir/${pkgname}-${pkgver}
    NODE_OPTIONS="--max_old_space_size=4096" pnpm build -b deb
}

package() {
    cd $srcdir/${reponame}-${pkgver}
    tar xpf src-tauri/target/release/bundle/deb/clash-verge_${pkgver}_*/data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}