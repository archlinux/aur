# Maintainer: Storm Dragon <storm_dragon@linux-a11y.org>
# Maintainer: Chrys <chrys@linux-a11y.org>

pkgname='fenrir'
pkgver=1.9.2.post1
pkgrel=3
pkgdesc='A user space console screen reader written in python3'
arch=('any')
url="https://linux-a11y.org/index.php?page=fenrir-screenreader"
license=('LGPL')
depends=('python' 'python-pyudev' 'python-daemonize' 'python-evdev' 'python-dbus' 'python-pyte')
optdepends=('brltty: For Braille support'
'gstreamer: for soundicons via gstreamer'
  'sox: The default sound driver'
  'python-espeak: TTS support'
  'python-pyenchant: for spell check functionality'
  'xclip: for copy to X session clipboard'
  'speech-dispatcher: TTS support')
makedepends=('python-setuptools')
provides=('fenrir')
conflicts=('fenrir')
backup=('etc/fenrirscreenreader/settings/settings.conf')
install="$pkgname".install
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}-screenreader/${pkgname}-screenreader-${pkgver}.tar.gz"
  'fenrir.install'
  'fenrirscreenreader.service')
md5sums=('60b2aca05b8a787e0e70768826694618'
         'c6a68679e6f1a23d4054d0209ba5210a'
         '0c2d1bd344b53d1fa5de6c49455b5a4f')

package() {
  install -d "$pkgdir/usr/lib/systemd/system/"
  install -Dm644 fenrirscreenreader.service "$pkgdir/usr/lib/systemd/system/fenrirscreenreader.service"
cd "${srcdir}/${pkgname}-screenreader-${pkgver}"
  python setup.py install --force-settings --root="${pkgdir}/" --optimize=1
}

# vim: set ts=2 sw=2 et:
