# Maintainer: Storm Dragon <storm_dragon@stormux.org>
# Contributor: Chrys <chrys@linux-a11y.org>

pkgname="fenrir"
pkgver=2026.05.25
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
  'python-xlib: X11 terminal mode with fenrir -x'
  'xclip: for copy to X session clipboard')
makedepends=('git' 'python-setuptools' 'python-setuptools-scm')
provides=('fenrir')
conflicts=('fenrir-git')
backup=('etc/fenrirscreenreader/settings/settings.conf')
source=("git+https://git.stormux.org/storm/${pkgname}.git#tag=${pkgver}")
install=fenrir.install
sha512sums=('7caa5b649dc08d712eb0f981664d79311fa48f663a40163149ded56078826adcdbb3632a6528c4c6b9ade6bb9be95aedfacd6ac115fb764e9538971e329aeced')

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --force-settings --root="${pkgdir}/" --optimize=1
  install -d "$pkgdir/usr/lib/systemd/system/"
  install -Dm644 autostart/systemd/Arch/fenrir.service "$pkgdir/usr/lib/systemd/system/fenrirscreenreader.service"
}

# vim: set ts=2 sw=2 et:
