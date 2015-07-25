# Maintainer: Nuno Araujo <nuno.araujo@russo79.com>
pkgname=mutantfactions
pkgver=1.08
pkgrel=1
pkgdesc="Free multiplayer action game"
arch=('i686' 'x86_64')
url="http://mutantfactions.net"
license=('custom')
depends=('unionfs-fuse' 'hicolor-icon-theme' 'xdg-utils')
if [[ "$CARCH" == "x86_64" ]]; then
  depends+=('lib32-glu' 'lib32-libxrandr' 'lib32-freealut')
else
  depends+=('glu' 'libxrandr' 'freealut')
fi
optdepends=()
conflicts=('subvein')
replaces=('subvein')
install=mutantfactions.install
source=("http://mutantfactions.net/downloads/MutantFactions1080.tar.gz"
        "mutantfactions"
        "mutantfactions-server"
        "mutantfactions.service"
        "etc_confd_mutantfactions"
        "mutantfactions-16x16.png"
        "mutantfactions-24x24.png"
        "mutantfactions-32x32.png"
        "mutantfactions-48x48.png"
        "mutantfactions-64x64.png"
        "mutantfactions.desktop")
md5sums=('edba55c5c743649c64711ac182388970'
         '415352df252c48df74e738735eed903f'
         '59164a2e1a8bb8005abcb1529ccd2e5d'
         '90647a6ec51f37085ab3a43842925c2b'
         'b01cfca81170bce397091f05febd8e5e'
         '146240abe45b133a5c5ea2c0fdd17b7d'
         'cac9d34ccd69e207d14e55aa28a0d280'
         '64058b1043f76a92e8da3cfad4345f66'
         '1a806f08c1d728528bfcb546ba390dba'
         '967ba3a3dbf9db02037275ea36b64b19'
         '8d30e75e332d85c990de235a1f7827fa')

package() {
  mkdir -p $pkgdir/opt/mutantfactions
  cp -r $srcdir/MutantFactions/. $pkgdir/opt/mutantfactions
  rm -rf $pkgdir/opt/mutantfactions/lib
  chmod -R g+w $pkgdir/opt/mutantfactions/data

  install -m 755 -D $srcdir/mutantfactions $pkgdir/usr/bin/mutantfactions
  install -m 755 -D $srcdir/mutantfactions-server $pkgdir/usr/bin/mutantfactions-server
  install -m 644 -D $srcdir/mutantfactions.service $pkgdir/usr/lib/systemd/system/mutantfactions.service
  install -m 644 -D $srcdir/etc_confd_mutantfactions $pkgdir/etc/conf.d/mutantfactions
  install -m 644 -D $srcdir/mutantfactions-16x16.png $pkgdir/usr/share/icons/hicolor/16x16/apps/mutantfactions.png
  install -m 644 -D $srcdir/mutantfactions-24x24.png $pkgdir/usr/share/icons/hicolor/24x24/apps/mutantfactions.png
  install -m 644 -D $srcdir/mutantfactions-32x32.png $pkgdir/usr/share/icons/hicolor/32x32/apps/mutantfactions.png
  install -m 644 -D $srcdir/mutantfactions-48x48.png $pkgdir/usr/share/icons/hicolor/48x48/apps/mutantfactions.png
  install -m 644 -D $srcdir/mutantfactions-64x64.png $pkgdir/usr/share/icons/hicolor/64x64/apps/mutantfactions.png
  install -m 644 -D $srcdir/mutantfactions.desktop $pkgdir/usr/share/applications/mutantfactions.desktop
  install -m 755 -d $pkgdir/var/lib/mutantfactions
}

# vim:set ts=2 sw=2 et:
