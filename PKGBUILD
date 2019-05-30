# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=tuhi-git
pkgver=20190503
pkgrel=1
pkgdesc="DBus daemon to access Wacom SmartPad devices"
arch=('any')
depends=(python-svgwrite)
makedepends=('git' 'python-setuptools')
url="https://github.com/tuhiproject/tuhi"
license=('GPL2')
source=(git+https://github.com/tuhiproject/tuhi)
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm755 tools/tuhi-live.py "${pkgdir}/usr/bin/tuhi-live.py"
  install -Dm755 tools/tuhi-kete-sandboxed.py "${pkgdir}/usr/bin/tuhi-kete-sandboxed.py"
  install -Dm755 tools/parse_log.py "${pkgdir}/usr/bin/parse_log.py"
  install -Dm755 tools/kete.py "${pkgdir}/usr/bin/kete.py"
  install -Dm755 tools/tuhi-live.py "${pkgdir}/usr/bin/tuhi-live.py"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/tuhi/README.md"
}
