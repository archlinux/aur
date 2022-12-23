# Maintainer: jlaunay
# Contributor: Jan Subelj <jan dot subelj010 at gmail dot com>
pkgname=g910-gkeys-git
_appname=g910-gkeys
_gitname=g910-gkey-macro-support
pkgver=0.2.5
pkgrel=2
pkgdesc='GKey support for Logitech G910 Keyboard on GNU/Linux'
url='https://github.com/JSubelj/g910-gkey-macro-support'
arch=('any')
license=('GPL3')
depends=('python-pyusb' 'python-uinput')
source=('git+https://github.com/JSubelj/g910-gkey-macro-support.git')
install=${pkgname}.install
backup=("etc/${_appname}/config.json" "usr/lib/systemd/system/g910-gkeys.service")
md5sums=('SKIP')

build() {
    cd ${srcdir}/${_gitname}
    python setup.py build
}

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd ${srcdir}/${_gitname}
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 -t $pkgdir/usr/lib/systemd/system g910-gkeys.service
}
