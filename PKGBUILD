# Maintainer: Stuart Mumford
pkgname=goes16-background-git
pkgver=0.1
pkgrel=1
pkgdesc="Put near-realtime picture of Earth as your desktop background."
arch=(any)
url="https://github.com/cameronleger/goes16-background"
license=('MIT')
depends=('python-setuptools' 'python-lxml' 'python-pillow')
optdepends=('feh: Changing wallpaper with i3')
source=("goes16-background::git+https://github.com/cameronleger/goes16-background.git")
md5sums=('SKIP')

package() {
  cd "$srcdir/goes16-background"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  sed -i "s%<INSTALLATION_PATH>%/usr/bin/goes16-background%" systemd/goes16-background.service
  mkdir -p ${pkgdir}/usr/lib/systemd/user/
  install -m644 -D systemd/goes16-background.service ${pkgdir}/usr/lib/systemd/user/
  install -m644 -D systemd/goes16-background.timer ${pkgdir}/usr/lib/systemd/user/
}

# vim:set ts=2 sw=2 et:
