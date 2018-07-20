# Maintainer: Storm Dragon <storm_dragon@linux-a11y.org>
# Maintainer: Chrys <chrys@linux-a11y.org>

_gitname='fenrir'
pkgname="${_gitname}-git"
pkgver=1.9.44.g98660d17
pkgrel=1
pkgdesc='A user space console screen reader written in python3'
arch=('any')
url="https://linux-a11y.org/index.php?page=fenrir-screenreader"
license=('LGPL')
depends=('python' 'python-pyudev' 'python-daemonize' 'python-evdev' 'python-dbus' 'python-pyte')
optdepends=('brltty: For Braille support'
'gstreamer: for soundicons via gstreamer'
  'sox: The default sound driver'
  'python-espeak: TTS support'
  'python-pyttsx: TTS support'
  'python-pyenchant: for spell check functionality'
  'xclip: for copy to X session clipboard'
  'speech-dispatcher: TTS support')
makedepends=('git')
provides=('fenrir')
conflicts=('fenrir')
backup=('etc/fenrirscreenreader/settings/settings.conf')
install="$pkgname".install
source=("git+https://github.com/chrys87/${_gitname}.git"
  'fenrirscreenreader.service'
  'fenrir-git.install')
md5sums=('SKIP'
         '0c2d1bd344b53d1fa5de6c49455b5a4f'
         'a0ffeb2a5eb3a4569b65e22239063ff7')

pkgver()
{
  cd "$srcdir/$_gitname"
  local ver="$(git describe --tags)"
  ver="${ver#*-}r"
  echo "${ver//-/.}"
}

package()
{
  install -d "$pkgdir/usr/lib/systemd/system/"
  install -Dm644 fenrirscreenreader.service "$pkgdir/usr/lib/systemd/system/fenrirscreenreader.service"
  cd "$srcdir/$_gitname"
  python setup.py install --force-settings --root="${pkgdir}/" --optimize=1
}

# vim: set ts=2 sw=2 et:
