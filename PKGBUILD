# Maintainer: morguldir <morguldir@protonmail.com>

pkgname=xenontrade
pkgver=1.2.3
pkgrel=1
pkgdesc='Path of Exile trading overlay'
arch=(x86_64)
license=(MIT)
url='https://github.com/klayveR/xenontrade'
depends=(gtk3 nss wmctrl libxss)
makedepends=(git node-gyp nodejs-lts-dubnium python yarn)
provides=(xenontrade)
_taghash=71ca3db5d8f49283e50c395bfb64c19f1217d3f7 # v1.2.3
source=("git+https://github.com/und3rdg/xenontrade#tag=$_taghash"
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

    mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
    install -m644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
