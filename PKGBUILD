# Maintainer: Håvard Pettersson <mail@haavard.me>
# Contributor: robertfoster

_pkgname=sounddevice
pkgbase=python-$_pkgname-git
pkgname=(python-$_pkgname-git python2-$_pkgname-git)
pkgver=0.3.10.2.g5eb0041
pkgrel=1
pkgdesc='Play and Record Sound with Python'
url='http://python-sounddevice.rtfd.io/'
license=('MIT')
arch=('any')
depends=(portaudio python python-cffi)
makedepends=(python-setuptools python2-setuptools python2-cffi)
optdepends=('python-numpy: to play back and record NumPy arrays')
conflicts=(python-sounddevice)
source=("${pkgname[0]}::git+https://github.com/spatialaudio/python-sounddevice.git")
sha256sums=(SKIP)

pkgver() {
  cd ${pkgname[0]}
  git describe --tags --long | sed 's/-/./g'
}

prepare() {
  cp -a ${pkgname[0]} ${pkgname[1]}
}

build(){
  cd "$srcdir/${pkgname[0]}"
  python setup.py build

  cd "$srcdir/${pkgname[1]}"
  python2 setup.py build
}

package_python-sounddevice-git() {
  cd ${pkgname[0]}
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-sounddevice-git() {
  depends=(portaudio python2 python2-cffi)
  optdepends=('python2-numpy: to play back and record NumPy arrays')
  conflicts=(python2-sounddevice)

  cd ${pkgname[1]}
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
