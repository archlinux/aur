# Maintainer: Popolon <popolon @ popolon.org>
# Contributor: Luke Arms <luke@arms.to>
# Contributor: Lara Maia <lara@craft.net.br>
# Contributor: Nuno Araujo <nuno.araujo at russo79.com>
# Contributor: Guan Qing <neokuno@gmail.com>
# Contributor: Liudas <liudas@akmc.lt>
# Contributor: Tom Tryfonidis <tomtryf [at] gmail [dot] com>

pkgname=key-mon-git
_pkgname=key-mon
pkgver=1.20.r6.g26e4205
pkgrel=1
url="https://github.com/scottkirkwood/key-mon"
pkgdesc="A screencast utility that displays your keyboard and mouse status"
arch=('any')
license=('Apache')
depends=('gtk3' 'python' 'python-cairo' 'python-gobject' 'python-xlib')
makedepends=('python-setuptools')
conflicts=('key-mon')
provides=('key-mon')
source=("${_pkgname}::git+https://github.com/scottkirkwood/key-mon")
sha256sums=(SKIP)

pkgver() {
  cd "$srcdir/${_pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgname}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
