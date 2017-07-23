# Maintainer: Storm Dragon <stormdragon2976@gmail.com>
# Maintainer: Chrys <mail@chrys.de>

_gitname='fenrir'
pkgname="${_gitname}-git"
pkgver=v0.5.5.g33af5b6
pkgrel=1
pkgdesc='A user space console screen reader written in python3'
arch=('any')
url="https://linux-a11y.org/index.php?page=fenrir-screenreader"
license=('LGPL')
depends=('python' 'python-daemonize' 'python-evdev' 'python-dbus')
optdepends=('brltty: For Braille support'
'gstreamer: for soundicons via gstreamer'
  'sox: The default sound driver'
  'python-espeak: TTS support'
  'python-pyenchant: for spell check functionality'
  'speech-dispatcher: TTS support')
makedepends=('git')
provides=('fenrir')
conflicts=('fenrir')
backup=('etc/fenrir/settings/settings.conf')
install="$pkgname".install
source=("git+https://github.com/chrys87/${_gitname}.git"
  'fenrir-git.install')
md5sums=('SKIP'
         'c65d87136e36b20f97e9112b60c97acf')

pkgver()
{
  cd "$srcdir/$_gitname"
  local ver="$(git describe --tags)"
  echo "${ver//-/.}"
}

package()
{
  cd "$srcdir/$_gitname"
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
