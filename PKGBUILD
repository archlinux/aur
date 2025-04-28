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
depends=('espeak-ng' 'python' 'python-pyudev' 'python-daemonize' 'python-evdev' 'python-dbus' 'python-pyperclip' 'python-pyte')
optdepends=('brltty: For Braille support'
'gstreamer: for soundicons via gstreamer'
'socat: Control running Fenrir screenreader'
  'sox: The default sound driver'
  'python-pythondialog: For TUI configuration tool'
  'python-pyenchant: for spell check functionality'
  'xclip: for copy to X session clipboard'
  'speech-dispatcher: TTS support')
makedepends=('git' 'python-setuptools' 'python-setuptools-scm')
provides=('fenrir')
conflicts=('fenrir')
backup=('etc/fenrirscreenreader/settings/settings.conf')
source=("git+https://git.stormux.org/storm/${_gitname}.git"
  'fenrirscreenreader.service')
install=fenrir-git.install
sha512sums=('SKIP'
            'e5e690bd9084d20a3c96ed391989e1db5211ef65b36a18ca6a49f8e16b40771a8a35151388df69d3cc64459d075ecb5fd0c415e11dfb43bc6ed2927612262168')

pkgver()
{
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package()
{
  install -d "$pkgdir/usr/lib/systemd/system/"
  install -Dm644 fenrirscreenreader.service "$pkgdir/usr/lib/systemd/system/fenrirscreenreader.service"
  cd "$srcdir/$_gitname"
  python setup.py install --force-settings --root="${pkgdir}/" --optimize=1
}

# vim: set ts=2 sw=2 et:
