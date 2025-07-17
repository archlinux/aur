# Maintainer: Storm Dragon <storm_dragon@linux-a11y.org>
# Contributor: Chrys <chrys@linux-a11y.org>

pkgname="fenrir"
pkgver=2025.07.16
pkgrel=1
epoch=1
pkgdesc='A user space console screen reader written in python3'
arch=('any')
url="https://git.stormux.org/storm/fenrir"
license=('LGPL')
depends=('python' 'python-pyudev' 'python-daemonize' 'python-evdev' 'python-dbus' 'python-pyperclip' 'python-pyte' 'python-pyxdg' 'python-setproctitle' 'python-pyenchant' 'python-pexpect')
optdepends=('espeak-ng: Default speech synthesizer for the generic speech driver'
'gstreamer: for soundicons via gstreamer'
'socat: Control running Fenrir screenreader'
  'sox: The default sound driver'
  'python-pythondialog: For the configure_fenrir.py tool'
  'xclip: for copy to X session clipboard'
  'speech-dispatcher: TTS support')
makedepends=('git' 'python-setuptools' 'python-setuptools-scm')
provides=('fenrir')
conflicts=('fenrir-git')
backup=('etc/fenrirscreenreader/settings/settings.conf')
source=("git+https://git.stormux.org/storm/${pkgname}.git#tag=${pkgver}"
  'fenrirscreenreader.service')
install=fenrir.install
sha512sums=('b392d080393191f4fb9652a3877fa46a6e2a99fa50626606636f6ed67ef652cb027969cc631cf68ff75dea3fca9133517d2afa06fcebaf81640735f9385637df'
            'e5e690bd9084d20a3c96ed391989e1db5211ef65b36a18ca6a49f8e16b40771a8a35151388df69d3cc64459d075ecb5fd0c415e11dfb43bc6ed2927612262168')

package() {
  install -d "$pkgdir/usr/lib/systemd/system/"
  install -Dm644 fenrirscreenreader.service "$pkgdir/usr/lib/systemd/system/fenrirscreenreader.service"
  cd "$srcdir/$pkgname"
  python setup.py install --force-settings --root="${pkgdir}/" --optimize=1
}

# vim: set ts=2 sw=2 et:
