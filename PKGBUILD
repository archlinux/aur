# Maintainer: Storm Dragon <storm_dragon@stormux.org>
# Contributor: Chrys <chrys@linux-a11y.org>

pkgname="fenrir"
pkgver=2026.09.09
pkgrel=1
epoch=1
pkgdesc='A user space console screen reader written in python3'
arch=('any')
url="https://git.stormux.org/storm/fenrir"
license=('LGPL')
depends=('gst-plugins-base' 'gst-plugins-good' 'gstreamer' 'python' 'python-gobject' 'python-pyudev' 'python-daemonize' 'python-evdev' 'python-dbus' 'python-pyperclip' 'python-pyte' 'python-pyxdg' 'python-setproctitle' 'python-pyenchant' 'speech-dispatcher')
optdepends=('espeak-ng: Default speech synthesizer for the generic speech driver'
'socat: Control running Fenrir screenreader'
  'sox: A sound driver'
  'python-pyusb: DECtalk USB speech output'
  'python-xlib: X11 terminal mode with fenrir -x'
  'xclip: for copy to X session clipboard')
makedepends=('git' 'python-setuptools' 'python-setuptools-scm')
provides=('fenrir')
conflicts=('fenrir-git')
backup=('etc/fenrirscreenreader/settings/settings.conf')
source=("git+https://git.stormux.org/storm/${pkgname}.git#tag=${pkgver}")
install=fenrir.install
sha512sums=('f45a22ad4cd6f4cfe39b8f9a47945cee3d989f23e5d1f215a99e89bd83952cc1199fba47db214eea08228220a0392b84ba7b87835a4b4c0fa8180859967d926b')

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --force-settings --root="${pkgdir}/" --optimize=1
  install -d "$pkgdir/usr/lib/systemd/system/"
  install -Dm644 autostart/systemd/Arch/fenrir.service "$pkgdir/usr/lib/systemd/system/fenrirscreenreader.service"
}

# vim: set ts=2 sw=2 et:
