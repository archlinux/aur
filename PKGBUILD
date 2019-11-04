# Maintainer: morguldir <morguldir@protonmail.com>

pkgname=xenontrade
pkgver=0.6.3
pkgrel=3
pkgdesc='Path of Exile trading overlay'
arch=(x86_64)
license=(MIT)
url='https://github.com/klayveR/xenontrade'
depends=(gtk3 gdk-pixbuf2 libxtst nss wmctrl)
makedepends=(git node-gyp nodejs-lts-carbon python yarn)
provides=(xenontrade)
source=("git+https://github.com/und3rdg/xenontrade#tag=v$pkgver"
        "xenontrade.sh"
        "resizable.patch"
        "icons.patch")
sha256sums=('SKIP'
            '4050ea55730e76bdd90ab183bf687f5a614ee6ea303556400bd803ab7d01a2e7'
            'd7903f0185ed41a5b6702b583f2c8858d7d650bf9052d24e561b8ba9d1b4a6c3'
            '2fc1a8590778a68a8e436ae5d941ebdd694a71149752b2d6a700c9686956fd7f')

prepare()
{
    cd "$srcdir/$pkgname"
    git apply "$srcdir"/resizable.patch
    git apply "$srcdir"/icons.patch
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
