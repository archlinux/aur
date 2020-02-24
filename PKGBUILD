# Maintainer: morguldir <morguldir@protonmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=python2-evdev
pkgver=1.3.0
pkgrel=2
pkgdesc="Python2 bindings for the Linux input subsystem"
arch=(x86_64)
url="https://python-evdev.readthedocs.io/en/latest/"
license=(BSD)
depends=(python2-pbr)
makedepends=(python2 git)
source=("git+https://github.com/gvalkov/python-evdev#tag=v$pkgver"
        "https://patch-diff.githubusercontent.com/raw/gvalkov/python-evdev/pull/119.patch")
sha256sums=('SKIP'
            'aedf0f1623572f448ea049d7c5ee60c7fcf5334bc619a4e2a2b1ecba3def6627')

pkgver() {
  cd python-evdev
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd python-evdev
  git apply ../119.patch
}

build() {
  cd python-evdev
  python2 setup.py build
}

package() { 
  cd python-evdev
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dt "$pkgdir/usr/share/licenses/python2-evdev" -m644 LICENSE
}
