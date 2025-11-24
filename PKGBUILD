# Maintainer: Storm Dragon <storm_dragon@linux-a11y.org>
# Contributor: Chrys <chrys@linux-a11y.org>

_gitname='fenrir'
pkgname="${_gitname}-git"
pkgver=r3322.4672592d
pkgrel=1
epoch=1
pkgdesc='A user space console screen reader written in python3'
arch=('any')
url="https://git.stormux.org/storm/fenrir"
license=('LGPL')
depends=('espeak-ng' 'python' 'python-pyudev' 'python-daemonize' 'python-evdev' 'python-dbus' 'python-pyperclip' 'python-pyte' 'python-pyxdg' 'python-setproctitle' 'python-pyenchant' 'python-pexpect')
optdepends=('gstreamer: for soundicons via gstreamer'
'socat: Control running Fenrir screenreader'
  'sox: The default sound driver'
  'xclip: for copy to X session clipboard'
  'speech-dispatcher: TTS support')
makedepends=('git' 'python-setuptools' 'python-setuptools-scm')
provides=('fenrir')
conflicts=('fenrir')
backup=('etc/fenrirscreenreader/settings/settings.conf')
source=("git+https://git.stormux.org/storm/${_gitname}.git")
install=fenrir-git.install
sha512sums=('SKIP')

pkgver()
{
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package()
{
  cd "$srcdir/$_gitname"
  python setup.py install --force-settings --root="${pkgdir}/" --optimize=1
  install -d "$pkgdir/usr/lib/systemd/system/"
  install -Dm644 autostart/systemd/Arch/fenrir.service "$pkgdir/usr/lib/systemd/system/fenrirscreenreader.service"
}

# vim: set ts=2 sw=2 et:
