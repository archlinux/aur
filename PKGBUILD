pkgname=tuxonice-userui
pkgver=1.1.1
pkgrel=1
pkgdesc="TuxOnIce userspace user interface"
url="https://github.com/NigelCunningham/Tuxonice-Userui"
license=("GPL")
install=tuxonice-userui.install
arch=('i686' 'x86_64')
depends=('bash' 'libmng' 'libpng' 'freetype2')
makedepends=('')
options=('!makeflags')
source=(
    'https://github.com/gdamjan/Tuxonice-Userui/archive/v1.1.1.tar.gz'
    'initcpio-install'
    'initcpio-hook'
    'pm-utils-hook'
    'systemd-hook'
)


build() {
  cd ${srcdir}/Tuxonice-Userui-${pkgver}
  make USE_FBSPLASH=yes
}

package () {
  cd ${srcdir}/Tuxonice-Userui-${pkgver}

  install -D -m644 $srcdir/initcpio-install $pkgdir/usr/lib/initcpio/install/userui
  install -D -m644 $srcdir/initcpio-hook    $pkgdir/usr/lib/initcpio/hooks/userui
  install -D -m755 $srcdir/pm-utils-hook    $pkgdir/etc/pm/sleep.d/80tuxonice-userui
  install -D -m755 $srcdir/systemd-hook     $pkgdir/usr/lib/systemd/system-sleep/tuxonice-userui.sh

  make INSTDIR=$pkgdir/usr/bin DESTDIR=$pkgdir PREFIX=/usr install
}

md5sums=('a04ea588012974beec16209a018677dc'
         'a8e8ecb03e319321713652e25bc34a98'
         '96a359994273ab0e8baa198914ef0433'
         '9f647880008584b7751c3f9ecec7945b'
         '44dcb2f1318ecac4155e275d28f1f443')
