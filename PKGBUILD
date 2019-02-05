# Maintainer: mrxx <mrxx at cyberhome dot at>
# Contributor: Jean Lucas <jean@4ray.co>

pkgname=r-linux
pkgver=5.6.173595
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
sha512sums_i686=('cf436890fd6c4206ca8e1fe519cda40b5850d300cb4ab38c35c366af592d1e5e56341c50cc106ad60a82f2b1f3fb834919410d91699a10b9d334686b2ba20f07')
sha512sums_x86_64=('0aa0010c8db17333211992cdbd7ea026ba1732b78c0541ec24a70954847315f1b91e436a3daed0146c4d2fa3fa28121a3651f0ac4aa0d14310fe2a92d2dda2ba')

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
