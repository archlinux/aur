# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>

pkgname=python-mediafile
_name=${pkgname#python-}
pkgver=0.6.0
pkgrel=1
pkgdesc='Simple interface to the metadata tags for many audio file formats'
url="https://github.com/beetbox/$_name"
arch=('any')
license=('MIT')
depends=('python' 'python-six' 'python-mutagen')
makedepends=('python-flit')
checkdepends=('python-nose')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        "fix-test.patch"
        "$_name-$pkgver-LICENSE::$url/raw/v$pkgver/LICENSE")
b2sums=('9040869432ba23fcdf51465f7c05da3167408cad1769c6e16a5c8d1f8cd09fa692de4c41555377c64f783d46dcb68c6714db29e7675dc2ea9a19a23d1893909b'
        '9f0550c4ffddedd330a01702659dd85e15e37bc273160aff56ad748e70b337514bda3792186afecc1b26a1d5e4b4e0d294116d955ac2d6d64d0e9a70b35a6557'
        '96edc3b852de4d26605eb0e8f90c6a8a873c249a258ccd60950220673c887318b50526508427826e6549b45600f7bacbff83bb764408181480fc5fb67f696ffe')

prepare() {
  patch -p1 "$_name-$pkgver"/test/test_mediafile.py < fix-test.patch
}

build() {
  cd "$_name-$pkgver"
  python3 setup.py build
}

check() {
  cd "$_name-$pkgver"
  python3 -m nose
}

package() {
  cd "$_name-$pkgver"
  python3 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 "$srcdir/$_name-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
