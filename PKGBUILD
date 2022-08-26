# Contributor: chrisl echo archlinux@c2h0r1i2s4t5o6p7h8e9r-l3u4n1a.com|sed 's/[0-9]//g'

pkgname=cemu-experimental-wine
pkgver=2.0
pkgrel=1
pkgdesc="Wii U emulator. This is the experimental Windows version via wine."
_name=cemu-wine
arch=(x86_64)
url="https://cemu.info/"
license=('custom')
depends=('wine' 'winetricks')
conflicts=('cemu-wine')
provides=('cemu-wine')
source=(
  cemu.sh
  cemu.xpm
  cemu.desktop
  cemu_${pkgver}-${pkgrel}.zip::https://cemu.info/releases/cemu_${pkgver}.zip
  https://web.archive.org/web/20180907210517if_/https://files.sshnuke.net/sharedFonts.7z
)
# The link for the sharedFonts comes from here: https://github.com/decaf-emu/decaf-emu/issues/29#issuecomment-315511347
install=${pkgname}.install
optdepends=('wine-ge-custom: Vulkan support')

# Sometimes, they update the zip file without changing its name, which causes the md5sum to fail.
# If you notice this, please mark this package as out-of-date in the aur website and I'll fix it.

md5sums=('9eb51ec8364251dcf6482d81a927dceb'
         '54d70005a8975812ab54fcfef53f7bde'
         'f1649814d35413763169cf750062d763'
         '617d551e4c215ee8380b7fd01648c834'
         '336a0bc0e44eede4ddf613a0eebf3bb9')


options=(!strip)

build() {
  cd $srcdir/
  cd Cemu_$pkgver
}
package() {
  cd $srcdir
  install -d -m755 $pkgdir/usr/share/
  install -d -m755 $pkgdir/usr/share/${_name}
  install -d -m755 $pkgdir/usr/bin
  install -m755 cemu.sh $pkgdir/usr/bin/cemu
  install -d -m755 $pkgdir/usr/share/applications
  install -d -m755 $pkgdir/usr/share/pixmaps
  install -m644 cemu.desktop $pkgdir/usr/share/applications
  install -m644 cemu.xpm $pkgdir/usr/share/pixmaps/cemu.xpm
  cp -R sharedFonts $pkgdir/usr/share/${_name}
  cd Cemu_$pkgver
  install -m644 Cemu.exe $pkgdir/usr/share/${_name}
  cp -R gameProfiles $pkgdir/usr/share/${_name}
  mkdir $pkgdir/usr/share/${_name}/mlc01
  cp -R shaderCache $pkgdir/usr/share/${_name}
  find $pkgdir/usr/share/${_name} -type f -exec chmod 644 {} \;
  find $pkgdir/usr/share/${_name} -type d -exec chmod 755 {} \;
}

