# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-testrepository
pkgver=0.0.20
pkgrel=10
pkgdesc="A repository of test results."
arch=('any')
license=('Apache' 'BSD')
url="https://launchpad.net/testrepository"
depends=('python38-testtools' 'python38-fixtures' 'python38-subunit')
makedepends=('python38-setuptools')
checkdepends=('python38-testresources' 'python38-pytz' 'python38-testscenarios')
source=("https://pypi.python.org/packages/source/t/testrepository/testrepository-$pkgver.tar.gz"
        testrepository-py3-tests.patch::https://github.com/testing-cabal/testrepository/commit/d3d6cac4fd42f2067c0dd81be748853f81c348fc.patch
        testrepository-new-testtools.patch::https://github.com/testing-cabal/testrepository/commit/8f8ab15fafdad6db850c84772323b32375b09285.patch
        testrepository-new-testtools-2.patch::https://github.com/testing-cabal/testrepository/commit/e2f84ae6b2bcf89221613056d0c45dd308f46d62.patch)
sha512sums=('df14500e2b27b6f39d9d4c4f42961efd63dfe25186e561eb1678952a8ab9311f17c36b78819fea33e0ac879c47a33d45c31ff58be017609c8a6157905ee712d6'
            '0bbeafcd9ee399a47f1a6ec7249ce9412a6d154b2738899bab75b9593a0703bf297c9a6654e8c4131ccef6daf7c111ed3033e6e3263b5cace28f135bc9593b3e'
            'b12926910a8f745515734bdc504b730341263d9d3ce44a598886b4e0aa0c9452a4b187e7926fb77e00837ce5f17ffdb6c3c84d53c06005e8caa29317bc42a62b'
            '544141753d48cfcc5b973fc4ef2b469df0c85829f6ad324a194c1502d561460d26041c58c21a7afec40ebd3930b2742732c94e06563c81c5e4a26f09a2f9b9bc')

prepare() {
  patch -d testrepository-$pkgver -p1 -i ../testrepository-py3-tests.patch
  patch -d testrepository-$pkgver -p1 -i ../testrepository-new-testtools.patch
  patch -d testrepository-$pkgver -p1 -i ../testrepository-new-testtools-2.patch
}

build() {
  cd testrepository-$pkgver
  python3.8 setup.py build
}

check() {
  cd testrepository-$pkgver
  python3.8 ./testr init
  python3.8 ./testr run --parallel
}

package() {
  cd testrepository-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
}
