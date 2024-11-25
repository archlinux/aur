# Maintainer: Storm Dragon <storm_dragon@linux-a11y.org>
# Contributor: Chrys <chrys@linux-a11y.org>

pkgname="fenrir"
pkgver=1.9.9
pkgrel=1
epoch=1
pkgdesc='A user space console screen reader written in python3'
arch=('any')
url="https://git.stormux.org/storm/fenrir"
license=('LGPL')
depends=('espeak-ng' 'python' 'python-pyudev' 'python-daemonize' 'python-evdev' 'python-dbus' 'python-pyte')
optdepends=('brltty: For Braille support'
'gstreamer: for soundicons via gstreamer'
'socat: Control running Fenrir screenreader'
  'sox: The default sound driver'
  'python-espeak: TTS support'
  'python-pyttsx: TTS support'
  'python-pyenchant: for spell check functionality'
  'xclip: for copy to X session clipboard'
  'speech-dispatcher: TTS support')
makedepends=('git' 'python-setuptools')
provides=('fenrir')
conflicts=('fenrir-git')
backup=('etc/fenrirscreenreader/settings/settings.conf')
source=("git+https://git.stormux.org/storm/${pkgname}.git#tag=${pkgver}"
  'fenrirscreenreader.service')
sha512sums=('9e7168215461e2380794d6aa0da8952e05c2dba8937599f4d1a91494532b86b33376cb0169327b3143521524b6e5718f5db73c1f22b97d64eba857d1fc8fa457'
            'dc73ab35120902222d7aab02ebd396790d0b9a7c2531746011dcd4169b5376cdd942909734dd77aae60275f537395684327759bed6fce675adac6699bbe0b262')

package() {
  install -d "$pkgdir/usr/lib/systemd/system/"
  install -Dm644 fenrirscreenreader.service "$pkgdir/usr/lib/systemd/system/fenrirscreenreader.service"
  cd "$srcdir/$pkgname"
  python setup.py install --force-settings --root="${pkgdir}/" --optimize=1
}

# vim: set ts=2 sw=2 et:
