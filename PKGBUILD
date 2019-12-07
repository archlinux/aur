# Maintainer: morguldir <morguldir@protonmail.com>

pkgname=xenontrade
pkgver=0.6.7
pkgrel=1
pkgdesc='Path of Exile trading overlay'
arch=(x86_64)
license=(MIT)
url='https://github.com/klayveR/xenontrade'
depends=(gtk3 gdk-pixbuf2 libxtst nss wmctrl)
makedepends=(git node-gyp nodejs-lts-carbon python yarn)
provides=(xenontrade)
source=("git+https://github.com/und3rdg/xenontrade#tag=v$pkgver"
        "xenontrade.sh")
sha256sums=('SKIP'
            '4050ea55730e76bdd90ab183bf687f5a614ee6ea303556400bd803ab7d01a2e7')

prepare()
{
    cd "$srcdir/$pkgname"
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
