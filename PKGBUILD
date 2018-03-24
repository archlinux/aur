# Maintainer: Storm Dragon <storm_dragon@linux-a11y.org>
# Maintainer: Chrys <chrys@linux-a11y.org>

_gitname='fenrir'
pkgname="${_gitname}-git"
pkgver=1.5.1.151.g7535ba7
pkgrel=1
pkgdesc='A user space console screen reader written in python3'
arch=('any')
url="https://linux-a11y.org/index.php?page=fenrir-screenreader"
license=('LGPL')
depends=('python' 'python-pyudev' 'python-daemonize' 'python-evdev' 'python-dbus')
optdepends=('brltty: For Braille support'
'gstreamer: for soundicons via gstreamer'
  'sox: The default sound driver'
  'python-espeak: TTS support'
  'python-pyttsx: TTS support'
  'python-pyenchant: for spell check functionality'
  'python-pyte: for pty driver support (terminal emulators)'
  'xclip: for copy to X session clipboard'
  'speech-dispatcher: TTS support')
makedepends=('git')
provides=('fenrir')
conflicts=('fenrir')
backup=('etc/fenrirscreenreader/settings/settings.conf')
install="$pkgname".install
source=("git+https://github.com/chrys87/${_gitname}.git"
  'fenrir-git.install')
md5sums=('SKIP'
         '369b683a385c5dc34350d1218caa496b')

pkgver()
{
  cd "$srcdir/$_gitname"
  local ver="$(git describe --tags)"
  echo "${ver//-/.}"
}

package()
{
  cd "$srcdir/$_gitname"
  python setup.py install --force-settings --root="${pkgdir}/" --optimize=1
}

# vim: set ts=2 sw=2 et:
