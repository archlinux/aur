# Maintainer: <ayedeil at posteo dot com>
pkgname=bricklink-studio
pkgver=2.24.2_1
pkgrel=2
pkgdesc="Lego cad software created by Bricklink"
arch=('x86_64')
url="https://www.bricklink.com/v3/studio/download.page"
license=('custom')
depends=('wine')
makedepends=('innoextract')
source=("$pkgname-$pkgver.exe::https://s3.amazonaws.com/blstudio/Studio2.0/Archive/$pkgver/Studio+2.0.exe"
        "$pkgname.sh"
        "$pkgname.desktop"
        "$pkgname.xml")
noextract=("$pkgname-$pkgver.exe")
sha256sums=('793b9212d3ba790f5bb34e762980a3c60234861d484f65236fb4f8500930e8b2'
            'a6b6ec21561e2a9594d8ba9e7dc496b819060003eef52a98c474f256da626f24'
            '0751e793784b23635ac722df64954ad8dc2037e53fdffd79ad513ef0e79ab2de'
            '7d3e39b48657b25f93a4e680e4d1473dad004dca8338467028c9aa3dc498326a')
options=(!strip)

prepare() {
  innoextract -d "$srcdir" "$pkgname-$pkgver.exe"
}

package() {
  install -Dd "$pkgdir/usr/share/$pkgname"
  cp -r "$srcdir/app"/* "$pkgdir/usr/share/$pkgname"

  install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$srcdir/$pkgname.xml" "$pkgdir/usr/share/mime/packages/$pkgname.xml"
}

