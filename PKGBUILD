# Maintainer: morguldir <morguldir@protonmail.com>

pkgname=xenontrade
pkgver=0.6.3
pkgrel=2
pkgdesc='Path of Exile trading overlay'
arch=(x86_64)
license=(MIT)
url='https://github.com/klayveR/xenontrade'
depends=(gtk3 gdk-pixbuf2 libxtst nss wmctrl)
makedepends=(git node-gyp nodejs-lts-carbon python yarn)
provides=(xenontrade)
source=("git+https://github.com/und3rdg/xenontrade#tag=v$pkgver"
        "xenontrade.sh"
        "resizable.patch")
sha256sums=('SKIP'
            '4050ea55730e76bdd90ab183bf687f5a614ee6ea303556400bd803ab7d01a2e7'
            'f0f3c36f24181723fa612b6f937adb46a305b1187797cd14c4bb302a52d83289')

prepare()
{
    cd "$srcdir/$pkgname"
    git apply "$srcdir"/resizable.patch
    yarn install
}

build()
{
    cd "$srcdir/$pkgname"
    yarn run build --linux dir
}

package()
{
    mkdir -p "$pkgdir/opt/"
    mkdir -p "$pkgdir/usr/bin"
    cp -r "$srcdir/$pkgname/dist/linux-unpacked/" "$pkgdir/opt/XenonTrade"
    install -m755 "$srcdir/xenontrade.sh" "$pkgdir/usr/bin/xenontrade"
}
