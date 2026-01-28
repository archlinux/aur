# Maintainer: Storm Dragon <storm_dragon@linux-a11y.org>
# Contributor: Chrys <chrys@linux-a11y.org>

pkgname="fenrir"
pkgver=2026.01.28
pkgrel=1
epoch=1
pkgdesc='A user space console screen reader written in python3'
arch=('any')
url="https://git.stormux.org/storm/fenrir"
license=('LGPL')
depends=('gst-plugins-base' 'gst-plugins-good' 'gstreamer' 'python' 'python-gobject' 'python-pyudev' 'python-daemonize' 'python-evdev' 'python-dbus' 'python-pyperclip' 'python-pyte' 'python-pyxdg' 'python-setproctitle' 'python-pyenchant' 'python-pexpect' 'speech-dispatcher')
optdepends=('espeak-ng: Default speech synthesizer for the generic speech driver'
'socat: Control running Fenrir screenreader'
  'sox: A sound driver'
  'xclip: for copy to X session clipboard')
makedepends=('git' 'python-setuptools' 'python-setuptools-scm')
provides=('fenrir')
conflicts=('fenrir-git')
backup=('etc/fenrirscreenreader/settings/settings.conf')
source=("git+https://git.stormux.org/storm/${pkgname}.git#tag=${pkgver}")
install=fenrir.install
sha512sums=('d8aab55d5e4f8b1a08789f688de998682f4fe5183761c72f080b05ec1a1a026b567341f28fd3f4b48620a5c1d0dba3e3bb9e3c96ec9bb6e84f025949e6df80a6')

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --force-settings --root="${pkgdir}/" --optimize=1
  install -d "$pkgdir/usr/lib/systemd/system/"
  install -Dm644 autostart/systemd/Arch/fenrir.service "$pkgdir/usr/lib/systemd/system/fenrirscreenreader.service"
}

# vim: set ts=2 sw=2 et:
