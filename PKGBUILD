pkgname=tagspaces
pkgver=2.0.1
pkgrel=1
pkgdesc="TagSpaces is an open source personal data manager. It helps you organize files with tags on every platform."
arch=("i686" "x86_64")
url="http://tagspaces.org"
license=("AGPL")
depends=("node-webkit")
makedepends=("gendesk")
sha256sums=("54d4d3cfd6236cd2752594f6a804ac662f52557829951da536d004c8dd19b5cd")
source=("https://github.com/uggrock/tagspaces/archive/v${pkgver}.tar.gz")

prepare() {
  gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" --exec='nw /opt/'${pkgname}'/data/node-webkit/'
  echo "nw /opt/${pkgname}/data/node-webkit/" > $pkgname
}

package() {
  msg2 "create path and copy files"
  mkdir -p $pkgdir/opt/${pkgname}
  cp -R $srcdir/${pkgname}-${pkgver}/* $pkgdir/opt/${pkgname}
  sed -i "s/@@VERSION.@@BUILD.@@BID/${pkgver}-${pkgrel}/g" $pkgdir/opt/tagspaces/data/about.html
  sed -i "s/@@VERSION.@@BUILD/${pkgver}/g" $pkgdir/opt/tagspaces/data/about.html
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$srcdir/${pkgname}-${pkgver}/data/assets/icon.svg" "$pkgdir/usr/share/pixmaps/$pkgname.svg"
}
