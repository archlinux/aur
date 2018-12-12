# Maintainer: Santiago Torres-Arias <santiago@archlinux.org>
# Contributor: kpcyrd <git@rxv.cc>

pkgname=('reprotest')
pkgver=0.7.8
pkgrel=3
pkgdesc="Run a process twice and check the output for reproducibility"
arch=('any')
license=('GPL3')
url="https://salsa.debian.org/reproducible-builds/reprotest"
depends=('python-setuptools' 'python' 'python-rstr' 'python-distro'
         'diffoscope' 'fakeroot' 'libfaketime'
         'python-docutils' 'help2man')
optdepends=(
    'disorderfs: to enable the shuffle-dirents option'
    'python-progressbar: to show a progress bar during diffoscope')
source=(https://salsa.debian.org/reproducible-builds/reproducible-lfs/raw/master/releases/${pkgname}/${pkgname}_${pkgver}.tar.xz{,.asc})
sha512sums=('2f3f6c609c18f184b5c1eacd820f439e10432b2bc31f275838b297ce4b90e2657d1d900486412847b5b7fb7ec1c85eb67c3b8f68518d2da9bfb78a53b08bfccc'
            'SKIP')

validpgpkeys=("A405E58AB3725B396ED1B85C1318EFAC5FBBDBCE"
              "66AE2B4AFCCF3F52DA184D184B043FCDB9444540"
              "8B7868786C33E5C64C4D0A480816B9E18C762BAD")

build() {
  cd "$srcdir/${pkgname}"
  python setup.py build

  make -C doc
}

package() {
  cd "$srcdir/${pkgname}"
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644  doc/reprotest.1 "${pkgdir}/usr/share/man/man1/reprotest.1"
}
