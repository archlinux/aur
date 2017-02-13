# Maintainer: Storm Dragon <stormdragon2976@gmail.com>
# Maintainer: Chrys <mail@chrys.de>

pkgname='fenrir'
pkgver=1.00
pkgrel=1
pkgdesc='A user space console screen reader written in python3'
arch=('any')
url="https://github.com/chrys87/fenrir"
license=('LGPL')
depends=('python' 'python-daemonize' 'python-evdev')
optdepends=('brltty: For Braille support'
'gstreamer: for soundicons via gstreamer'
  'sox: The default sound driver'
  'python-espeak: TTS support'
  'python-pyenchant: for spell check functionality'
  'speech-dispatcher: TTS support')
makedepends=('unzip')
provides=('fenrir')
conflicts=('fenrir')
backup=('etc/settings/settings.conf') 
install="$pkgname".install
source=("https://github.com/chrys87/${pkgname}/archive/${pkgver}.zip"
  'fenrir.install')
md5sums=('0bafcb9e3af09799811b236e2116f4f1'
         '6e9e07056b744789e8d62fcf56b612ce') 

package()
{
  cd "$srcdir/${pkgname}-${pkgver}"
  install -m755 -d "$pkgdir/opt/fenrir"
 install -m755 -d "$pkgdir/usr/share/fenrir/scripts"
 install -m755 -d "$pkgdir/usr/share/fenrir/tools"
 install -m644 -D "config/keyboard/desktop.conf" "$pkgdir/etc/fenrir/keyboard/desktop.conf"
 install -m644 -D "config/keyboard/laptop.conf" "$pkgdir/etc/fenrir/keyboard/laptop.conf"
 install -m644 -D "config/punctuation/default.conf" "$pkgdir/etc/fenrir/punctuation/default.conf"
 install -m644 -D "config/settings/settings.conf" "$pkgdir/etc/fenrir/settings/settings.conf"
 install -d "$pkgdir/usr/share/sounds/fenrir"
  install -m644 -D "autostart/systemd/fenrir.service" "$pkgdir/usr/lib/systemd/system/fenrir.service"
  cp -a src/fenrir/* "$pkgdir/opt/fenrir"
  cp -a config/scripts/* "$pkgdir/usr/share/fenrir/scripts"
  cp -a tools/* "$pkgdir/usr/share/fenrir/tools"
  cp -a config/sound/* "$pkgdir/usr/share/sounds/fenrir"
}

# vim: set ts=2 sw=2 et:
