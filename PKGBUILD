# Maintainer: Storm Dragon <storm_dragon@linux-a11y.org>
# Contributor: Chrys <chrys@linux-a11y.org>

pkgname="fenrir"
pkgver=2025.12.06
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
sha512sums=('5b5f75bb1ec091bbec81e37e7511c9a0d76f8395dbc99af1337056a1bffb01097950be7d1597f5487247b9adb8f2238729928989e79f32f2aa449c6a0ebcfea0')

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --force-settings --root="${pkgdir}/" --optimize=1
  install -d "$pkgdir/usr/lib/systemd/system/"
  install -Dm644 autostart/systemd/Arch/fenrir.service "$pkgdir/usr/lib/systemd/system/fenrirscreenreader.service"
}

# vim: set ts=2 sw=2 et:
