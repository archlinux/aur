# Maintainer: mrxx <mrxx at cyberhome dot at>
# Contributor: Jean Lucas <jean@4ray.co>

pkgname=r-linux
pkgver=5.6.175721
pkgrel=1
pkgdesc="File recovery utility for the ext2/ext3/ext4 file system"
arch=('i686' 'x86_64')
url="https://www.r-tt.com/data_recovery_linux/"
license=('custom')
depends=('xorg-xhost')
optdepends=('gksu' 'kdesu' 'polkit')
source_i686=("$pkgname-$pkgver-i386.deb::https://www.r-tt.com/downloads/RLinux5_i386.deb")
source_x86_64=("$pkgname-$pkgver-x64.deb::http://www.r-tt.com/downloads/RLinux5_x64.deb")
source=(rlinux.sh)
sha512sums=('01ea9c642f46a35a9b90896a7b93c3b03a5256100d6a1443286a5da58fcdca0c49447a48a2a6c335ab334cb53965ed4269381ecdda94af39d2f3c8542ce2cbae')
sha512sums_i686=('4201a8f1cc24a3609e9e2889ca8497de85fac04cd4d22c31a4c9fca456db88b7e0f83908daa4f87a1d082061cc8d72d6d30becf3d8bb1242735e5eaa2b8e43da')
sha512sums_x86_64=('2a3c627426272c5fca273ff0a3bd2f9d4c78dcaf7c056d9c8ddd9aafcbeb01064ae8ca8b0becb9d21ad446e82a8c115564ed2cc48e07daa160d2567a17c863fc')

prepare() {
    bsdtar xf data.tar.gz
}

package() {
  install -d "$pkgdir"/opt
  install -d "$pkgdir"/usr/share/applications

  install -Dm 755 rlinux.sh "$pkgdir"/usr/bin/rlinux
  cp -r usr/local/R-Linux "$pkgdir"/opt/

  cd usr/local/R-Linux/share
  install -Dm 644 logo_48.png "$pkgdir"/usr/share/pixmaps/rtt-rlinux.png
  sed 's|Exec=.*|Exec=rlinux|' rtt-rlinux.desktop >"$pkgdir"/usr/share/applications/rtt-rlinux.desktop
  sed -i 's|/usr/local|/opt|' "$pkgdir"/opt/R-Linux/bin/rlinux
  install -Dm644 rln_viewer.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
