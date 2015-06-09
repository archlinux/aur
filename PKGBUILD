# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=coinmessage-git
pkgver=20131216
pkgrel=1
pkgdesc="Bitcoin-based secure messaging system"
arch=('any')
depends=('python2' 'python2-crypto' 'python2-pycoin')
makedepends=('git' 'python2-setuptools')
url="https://github.com/coinmessage/coinmessage"
license=('MIT')
source=(git+https://github.com/coinmessage/coinmessage)
sha256sums=('SKIP')
provides=('coinmessage')
conflicts=('coinmessage')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

prepare() {
  cd ${pkgname%-git}

  msg 'Fixing Python version...'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/python#/usr/bin/python2#g'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/env python#/usr/bin/env python2#g'
}

package() {
  cd ${pkgname%-git}

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
