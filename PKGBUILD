# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgname=setconf-py3
pkgver=0.6.3
pkgrel=1
pkgdesc='Utility to easily change settings in configuration files'
arch=('any')
url='http://setconf.roboticoverlords.org/'
license=('GPL2')
provides=('setconf')
conflicts=('setconf')
depends=('python')
source=("http://setconf.roboticoverlords.org/${pkgname/-py3}-$pkgver.tar.xz")
sha256sums=('859b72da867b57451d8139e268fe3faa58102504a942944a01e94920035e7ee1')

prepare() {
  2to3 "setconf-$pkgver" -w -n --no-diff
  cd "setconf-$pkgver"
  sed 's|main()|try:\n        main()|g' -i setconf.py
  echo -e '    except UnicodeDecodeError:' >> setconf.py
  echo -e '        print("Error: Only UTF-8 is supported for the Python 3 version, for now.")' >> setconf.py
}

package() {
  cd "setconf-$pkgver"

  install -Dm755 setconf.py "$pkgdir/usr/bin/setconf"
  install -Dm644 setconf.1.gz "$pkgdir/usr/share/man/man1/setconf.1.gz"
}

# vim:set ts=2 sw=2 et:
