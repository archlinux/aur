# Maintainer: mrxx <mrxx at cyberhome dot at>
# Contributor: Jean Lucas <jean@4ray.co>

pkgname=r-linux
pkgver=6.5.191641
pkgrel=1
pkgdesc="File recovery utility for the ext2/ext3/ext4 file system"
arch=('i686' 'x86_64')
url="https://www.r-tt.com/data_recovery_linux/"
license=('custom')
depends=('xorg-xhost')
optdepends=('gksu' 'kdesu' 'polkit')
source_i686=("$pkgname-$pkgver-i386.deb::"https://www.r-studio.com/downloads/RLinux6_i386.deb)
source_x86_64=("$pkgname-$pkgver-x64.deb::https://www.r-studio.com/downloads/RLinux6_x64.deb")
source=('rlinux.sh' 'elevate.sh')
sha512sums=('01ea9c642f46a35a9b90896a7b93c3b03a5256100d6a1443286a5da58fcdca0c49447a48a2a6c335ab334cb53965ed4269381ecdda94af39d2f3c8542ce2cbae'
            'a98ab704660e17f062ffa75a4e326da600fb7f6af4518dadfbb7e42673b86a521e825ab81dd28995fcf375bd609fe1522a8a48d884fe7433c8b4c2022307cb32')
sha512sums_i686=('ad913671e20e07553f6549d20cbd6a5411be144ac6d115d6fbb252e0d83572cd946fef1fad9508b2cadb1ce88822b54bfc5aa8979718b2e3c583e91a00becd04')
sha512sums_x86_64=('97959555f15cfb60efa8b2d61efaa8951e5c66f50274effe38d1c00caced057449df469e7086209d093dfedc720f94198b0213416d3f45ec442bda81b3c36042')

prepare() {
    bsdtar xf data.tar.gz
}

package() {
  install -d "$pkgdir"/opt
  install -d "$pkgdir"/usr/share/applications

  install -Dm 755 rlinux.sh "$pkgdir"/usr/bin/rlinux
  cp -r usr/local/R-Linux "$pkgdir"/opt/

  head -n -12 usr/local/R-Linux/bin/rlinux >"$pkgdir"/opt/R-Linux/bin/rlinux
  cat elevate.sh >>"$pkgdir"/opt/R-Linux/bin/rlinux
  sed -i 's|/usr/local|/opt|' "$pkgdir"/opt/R-Linux/bin/rlinux

  cd usr/local/R-Linux/share
  install -Dm 644 logo_48.png "$pkgdir"/usr/share/pixmaps/rtt-rlinux.png
  sed 's|/usr/local|/opt|' rtt-rlinux.desktop >"$pkgdir"/usr/share/applications/rtt-rlinux.desktop
  install -Dm644 rln_viewer.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
