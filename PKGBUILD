# Maintainer: Wolfgang Popp <mail@wolfgang-popp.de>

pkgname=python-ant-downloader-git
_pkgname=python-ant-downloader
pkgver=r473.28f5186
pkgrel=1
pkgdesc="Tools for download from garmin wireless (ANT) devices"
arch=('any')
url="https://github.com/braiden/python-ant-downloader"
license=('BSD')
depends=('python2' 'python2-pyusb' 'python2-lxml' 'python2-pyserial')
optdepends=('python2-requests')
makedepends=('git' 'python2-setuptools')
source=("$pkgname::git+https://github.com/braiden/python-ant-downloader.git"
        "99-antusb.rules"
        "setuptools.patch")
sha256sums=('SKIP'
            '556bc97347445719cdcf1e9de7686daedc13d9591f279265050bcdcdd57a8419'
            '73db7a9b659494271a673dcd761d0af67e80d14fb6ed42c579a9f7a6ad54c3d5')

pkgver(){
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"
  patch < $srcdir/setuptools.patch
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm 644 LICENSE $pkgdir/usr/share/licenses/$_pkgname/LICENSE
  install -Dm 644 "$srcdir/99-antusb.rules" $pkgdir/etc/udev/rules.d/99-antusb.rules
}

# vim:set ts=2 sw=2 et:
