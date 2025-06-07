# Maintainer: Storm Dragon <storm_dragon@linux-a11y.org>
# Contributor: Chrys <chrys@linux-a11y.org>

pkgname="fenrir"
pkgver=2025.06.07
pkgrel=1
epoch=1
pkgdesc='A user space console screen reader written in python3'
arch=('any')
url="https://git.stormux.org/storm/fenrir"
license=('LGPL')
depends=('python' 'python-pyudev' 'python-daemonize' 'python-evdev' 'python-dbus' 'python-pyte')
optdepends=('brltty: For Braille support'
'espeak-ng: Default speech synthesizer for the generic speech driver'
'gstreamer: for soundicons via gstreamer'
'socat: Control running Fenrir screenreader'
  'sox: The default sound driver'
  'python-pythondialog: For the configure_fenrir.py tool'
  'python-pyenchant: for spell check functionality'
  'xclip: for copy to X session clipboard'
  'speech-dispatcher: TTS support')
makedepends=('git' 'python-setuptools' 'python-setuptools-scm')
provides=('fenrir')
conflicts=('fenrir-git')
backup=('etc/fenrirscreenreader/settings/settings.conf')
source=("git+https://git.stormux.org/storm/${pkgname}.git#tag=${pkgver}"
  'fenrirscreenreader.service')
install=fenrir.install
sha512sums=('c8dca6bddf41d3b84cafd6bc9350d445ed2609ee2358dfc9ec1ab8e18e0d2a3a22b3ecb40a33572f9a8807398438b1dbf46fd3042a6184c753b490f32d24a2bd'
            'e5e690bd9084d20a3c96ed391989e1db5211ef65b36a18ca6a49f8e16b40771a8a35151388df69d3cc64459d075ecb5fd0c415e11dfb43bc6ed2927612262168')

package() {
  install -d "$pkgdir/usr/lib/systemd/system/"
  install -Dm644 fenrirscreenreader.service "$pkgdir/usr/lib/systemd/system/fenrirscreenreader.service"
  cd "$srcdir/$pkgname"
  python setup.py install --force-settings --root="${pkgdir}/" --optimize=1
}

# vim: set ts=2 sw=2 et:
