# Maintainer: Storm Dragon <storm_dragon@stormux.org>
# Contributor: Chrys <chrys@linux-a11y.org>

pkgname="fenrir"
pkgver=2026.09.12
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
sha512sums=('389f4d834bfc571f8476b3c13da34d4b1ec71d84c3c765ebdaf6d689c338e2c75aafb66d935129f6a4be4459abed3b16425915e4de83b58496a7f4a374e4a231')

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --force-settings --root="${pkgdir}/" --optimize=1
  install -d "$pkgdir/usr/lib/systemd/system/"
  install -Dm644 autostart/systemd/Arch/fenrir.service "$pkgdir/usr/lib/systemd/system/fenrirscreenreader.service"
}

# vim: set ts=2 sw=2 et:
