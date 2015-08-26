# Maintainer: BxS <bxsbxs at gmail dot com>

pkgname='pk2cmd-plus'
pkgver=1.21rc1_1.63.148
pkgrel=2
pkgdesc="PICkit 2 CLI software with updated DeviceFile and udev rules"
arch=('i686' 'x86_64')
url='http://www.microchip.com/pickit2'
license=('custom')
depends=('libusb-compat')
provides=('pk2cmd')
conflicts=('pk2cmd')
install=$pkgname.install
source=('http://ww1.microchip.com/downloads/en/DeviceDoc/PICkit2_PK2CMD_WIN32_SourceV1-21_RC1.zip'
        'PK2DeviceFile_v1.63.148.zip::http://www.microchip.com/forums/download.axd?file=0;749972'
        'pk2_devicefile_osfile_paths.patch'
        '60-pickit2.rules'
        'LICENSE')
md5sums=('6f93ede97be484ab7859626a9156a5d6'
         '3983ce4f45992318c4f0037c8d1acf9f'
         'c3972d96ac997eb35ae76a861eb4ae0c'
         'a5cf4ffff54af41c4d1cf8c97d007dcf'
         '6d53baa09ac4ac3907d503992349b17a')
[[ ${DLAGENTS[1]} == 'http::/usr/bin/curl'* ]] && DLAGENTS[1]="${DLAGENTS[1]::-3} -A firefox %u"

build() {
  cd $srcdir/pk2cmd/pk2cmd
  patch -Np1 -i $srcdir/pk2_devicefile_osfile_paths.patch
  make linux
}

package() {
  install -Dm 755 $srcdir/pk2cmd/pk2cmd/pk2cmd $pkgdir/usr/bin/pk2cmd
  install -Dm 644 $srcdir/PK2DeviceFile.dat $pkgdir/usr/share/pk2/PK2DeviceFile.dat
  install -Dm 644 $srcdir/pk2cmd/release/PK2V023200.hex $pkgdir/usr/share/pk2/PK2V023200.hex
  install -Dm 644 $srcdir/60-pickit2.rules $pkgdir/etc/udev/rules.d/60-pickit2.rules
  install -Dm 644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
