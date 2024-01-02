pkgname=tuxonice-userui
pkgver=1.2.0
pkgrel=1
pkgdesc="TuxOnIce userspace user interface"
url="https://github.com/gdamjan/Tuxonice-Userui"
license=("GPL")
install=tuxonice-userui.install
arch=('x86_64')
depends=('bash' 'libmng' 'libpng' 'libjpeg-turbo' 'freetype2')
makedepends=()
options=('!makeflags')
source=(
    'https://github.com/gdamjan/Tuxonice-Userui/archive/v'${pkgver}'.tar.gz'
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

sha256sums=('c607e172e7746c83889af760d2cc42d2bffb330d88d51a118d122731b1f09d82'
            'b275d7306aa2dbb76acb2c3684340418cfb0835435e2f58c1973bf162e2c000c'
            'dd6f403a0d38830c5d7dd6bc155f4d3c0fa904b87783cf6962f7e94edcc1047a'
            'c6a0f807c59929765fc6793d6d854c43c25ad57e62d0afd6c5ea8e247db9da3b'
            'c2d6d8ba21ba8037cbf1cf4889a58ab608d235934173d9659f9e1d7e1e9942ee')
