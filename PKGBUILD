# Maintainer: mrxx <mrxx at cyberhome dot at>
# Contributor: Jean Lucas <jean@4ray.co>

pkgname=r-linux
pkgver=5.5
pkgrel=1
pkgdesc="File recovery utility for the ext2/ext3/ext4 file system"
arch=('i686' 'x86_64')
url="https://www.r-tt.com/data_recovery_linux/"
license=('custom')
depends=('xorg-xhost')
optdepends=('gksu' 'kdesu' 'polkit')
source_i686=("https://www.r-tt.com/downloads/RLinux5_i386.deb")
source_x86_64=("http://www.r-tt.com/downloads/RLinux5_x64.deb")
source=(rlinux.sh)
sha512sums=('01ea9c642f46a35a9b90896a7b93c3b03a5256100d6a1443286a5da58fcdca0c49447a48a2a6c335ab334cb53965ed4269381ecdda94af39d2f3c8542ce2cbae')
sha512sums_i686=('fc37b03f04f4bea73204766de3fd29b539f706063b7982b95f6e0522401ab5df1ec199ba59ffe71f3d8464a0e0a38e5b9801bd9d5f3caa95988be7c2c16f7f63')
sha512sums_x86_64=('db6a9819a1afd81e04ce780b5d95a908d64268e7032ab3bb27d750b215aac898062e2e773056121279cd682ac0a131e4ab15f838a835ad00c757e28036c28a45')

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
