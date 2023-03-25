# Maintainer: celeste <yuan.zx at outlook dot com>

pkgname=vaa3d-bin
_pkgname=${pkgname%-bin}
pkgver=v3.601
pkgrel=4
pkgdesc="3D Visualization-Assisted Analysis"
arch=("any")
url="https://www.vaa3d.org"
license=("custom")
depends=("libpng12" "libtiff5")
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("LICENSE::https://github.com/Vaa3D/Vaa3D_Wiki/wiki/LicenseAndAgreement.wiki"
        "$_pkgname-$pkgver.tar.gz::https://github.com/Vaa3D/release/releases/download/$pkgver/Vaa3D_CentOS_64bit_$pkgver.tar.gz"
        "$_pkgname.desktop"
        "$_pkgname.png"
        "$_pkgname")
sha256sums=("SKIP"
            "d6f102c502a7be367ea7854bf561e492997ce0c19b4a0ad926fe1b308eead4f0"
            "fb3875215bc639cef05e0d67d58a57ebffaf404b9bbbc2e247c8813c533b3265"
            "f21e57d1823dc89dba830b85078b942b113145b4e75cb3bc5a1db96fe9e5e00b"
            "7648b51b9c220a7f7448ac55e98b56d96d291fcea83244292a6c852414e8f2ac")

check() {
  desktop-file-validate $srcdir/$_pkgname.desktop
}

package() {
  # license
  install -Dm644 $srcdir/LICENSE -t $pkgdir/usr/share/licenses/$pkgname/

  # binary
  rm $srcdir/bin/libstdc++.so.6*
  mkdir -p $pkgdir/opt/$pkgname
  cp -r $srcdir/bin/* $pkgdir/opt/$pkgname
  chmod 755 $pkgdir/opt/$pkgname/$_pkgname
  install -Dm755 -t $pkgdir/usr/bin $_pkgname

  # desktop
  desktop-file-install --dir $pkgdir/usr/share/applications/ $_pkgname.desktop
  install -Dm644 $_pkgname.png -t $pkgdir/usr/share/pixmaps
}
