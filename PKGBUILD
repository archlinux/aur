# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Ekin Dursun <ekindursun@gmail.com>

pkgname=python-mpv
pkgver=1.0.1
pkgrel=1
pkgdesc='Python interface to the awesome mpv media player'
arch=('any')
url=https://github.com/jaseg/python-mpv
_url_pypi=https://pypi.org/project/python-mpv
license=('GPL3')
depends=('mpv' 'python')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-xvfbwrapper')
optdepends=('python-pillow: raw screenshot support')
source=("https://github.com/jaseg/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
        'python-mpv-strategic-sleeps.patch::https://github.com/jaseg/python-mpv/commit/85aaed090f05198ce84f2c8c653ebe44c4288f8d.patch')
b2sums=('3ba95ac4d3219615c80ea475c1f6dc3acd608a8ded919eea55efac8bb44a8946c959a2b39473e6c9e80fa1a4e52f525d6ef9871e3eb4b2664aeb1460208bc677'
        'c7a4d141a75bec69ae78540bb5f5772899b457ebf154c46ff8418c097b60bd72046cd428233883a9c5cc99e2fb99138778a4b071b5168d78afabf686929bd883')

prepare() {
  cd $pkgname-$pkgver
  patch --forward --strip=1 --input=../python-mpv-strategic-sleeps.patch
}

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

check() {
  cd $pkgname-$pkgver
  pytest
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 'README.rst' -t "$pkgdir"/usr/share/doc/$pkgname
}
