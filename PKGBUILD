# Maintainer: seiuneko <chfsefefgesfen foxmail>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Hilton Medeiros <medeiros.hilton@gmail.com>

pkgname=python2-pbkdf2
pkgver=1.3
pkgrel=1
pkgdesc='Password-based key derivation function PBKDF2.'
arch=('any')
url='https://www.dlitz.net/software/python-pbkdf2/'
license=('MIT')
makedepends=('python2-setuptools' 'python-crypto')
depends=('python2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dlitz/python-pbkdf2/archive/v$pkgver.tar.gz")
sha512sums=('642372615a2ffc9cf352805789f836c42763c49cbf113d64524a55c6ff8a09f0fda36c92713387f27c2f6a2950ce89ae04dc9f92495cba904400685b148f947e')

prepare() {
  # python -> python2 rename
  find python-pbkdf2-$pkgver -type f -name '*py' -exec sed -e 's_#! \?/usr/bin/\(env \)\?python_&2_' -i {} \;
}

build() {
  msg2 "Building python..."
  (cd python-pbkdf2-${pkgver}
    python2 setup.py build
  )
}

check() {
  msg2 "Checking python..."
  (cd python-pbkdf2-${pkgver}
  python2 setup.py test
  )
}

package() {
  cd python-pbkdf2-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm 644 README.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.txt -t "${pkgdir}/usr/share/doc/${pkgname}"
}
