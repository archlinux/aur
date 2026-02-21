# Maintainer: themirrazz <themirrazzxyz@outlook.com>
pkgname=mobiusdrv
pkgdesc="Node.JS-based CUPS backend for MobilityPrint print servers"
pkgver=1.0.0
url="https://github.com/themirrazz/mobiusdrv"
pkgrel=1
arch=("x86_64")
license=('custom')
options=('!strip' '!debug')
source=("mobiusdrv-main.zip::https://codeload.github.com/themirrazz/mobiusdrv/zip/refs/heads/main"
        "node-sdk-main.zip::https://codeload.github.com/mobiuspr/node-sdk/zip/refs/heads/main")
sha256sums=("7b2abebf4d2cd477bb15b7eca48be6e9d7ed39d73f244f6a310e43373cf9f512"
            "1c68d4bfc9afd8adcc07cc0040f665c96df2321d8da87b95cf67c9f45ad61627")
depends=('nodejs>=23.0.0' 'npm')
makedepends=('unzip')

prepare() {
    # unzip mobiusdrv-main.zip
    # unzip node-sdk-main.zip
    echo "test"
}

package() {
    mkdir -p "$pkgdir/usr/lib/mobiusdrv/sdk"
    mkdir -p "$pkgdir/usr/lib/cups/backend/src"
    cd mobiusdrv-main
    mv mobius-bin.js mobius
    install -Dm755 -t "$pkgdir/usr/lib/cups/backend" mobius
    cd src
    install -Dm755 -t "$pkgdir/usr/lib/mobiusdrv" index.js driver.js package.json
    cd ../../node-sdk-main
    install -Dm755 -t "$pkgdir/usr/lib/mobiusdrv/sdk" package.json
    cd src 
    install -Dm755 -t "$pkgdir/usr/lib/mobiusdrv/sdk/src" aes.js fetch.js index.js jsbn.js jsencrypt.js index.d.ts utils.js
}