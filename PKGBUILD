# Maintainer: Yamakaky <yamakaky@yamaworld.fr>
pkgname=googleplaydownloader
pkgver=1.6
pkgrel=2
pkgdesc="A graphical software to download APKs from the Google Play store."
arch=(any)
url="https://codingteam.net/project/googleplaydownloader"
license=('AGPL')
depends=('python2'
         'python2-protobuf'
         'python2-requests'
         'wxpython'
         'python2-ndg-httpsclient')
optdepends=('java-runtime: needed for autogeneration of a new AndroiID')
makedepends=('gendesk')
options=(!emptydirs)
source=("https://codingteam.net/project/googleplaydownloader/download/file/googleplaydownloader-$pkgver.tar.gz"
        "googleplaydownloader"
        "googleplaydownloader.png::https://codingteam.net/project/googleplaydownloader/upload/icon.png")
sha1sums=('f0058fe53ed8f009d5e3bcda1ec2b3389d332fa0'
          '154d3ade5d56fdfdc1f7d590f7e06bdf6aba0bfa'
          '61de3e6b29fc82bacf98c8de9e3ad4cec6c70631')

prepare() {
    cd "$srcdir"
    gendesk -f \
        --pkgname="$pkgname" \
        --pkgdesc="$pkgdesc"
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python2 setup.py install --root="$pkgdir/" --optimize=1

    cd "$srcdir"
    install -D --mode=755 "googleplaydownloader" "$pkgdir/usr/bin/googleplaydownloader"
    install -D --mode=644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -D --mode=644 "$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
