# Maintainer: Wei-Ning Huang <aitjcize@gmail.com>
pkgname=python-pytox-git
_pkgname=PyTox
pkgver=20161230
pkgrel=1
pkgdesc="Python binding for Project-Tox the skype replacement"
arch=('i686' 'x86_64')
url="https://github.com/aitjcize/PyTox"
license=('GPL')
makedepends=(git)
depends=(python toxcore)
source=("git://github.com/aitjcize/${_pkgname}")
sha256sums=("SKIP")

pkgver() {
  cd $_pkgname
  git log -1 --pretty='%cd' --date=short | tr -d '-'
}

build() {
  cd $_pkgname

  sed -i -e "/toxcrypto/d" setup.py
  sed -i -e "/toxdht/d" setup.py
  sed -i -e "/toxfriends/d" setup.py
  sed -i -e "/toxgroup/d" setup.py
  sed -i -e "/toxmessenger/d" setup.py
  sed -i -e "/toxnetcrypto/d" setup.py
  sed -i -e "/toxnetwork/d" setup.py

  python setup.py build
}

package() {
  cd $_pkgname
  python setup.py install --root=${pkgdir}/ --optimize=1
}
