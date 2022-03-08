pkgname=mitogen
pkgver=0.3.2
pkgrel=2
pkgdesc="Distributed self-replicating programs in Python"
license=("BSD")
url="https://mitogen.networkgenomics.com/"
depends=('python')
makedepends=('python-setuptools')
optdepends=('ansible: for using the ansible strategy plugin')
source=("https://github.com/mitogen-hq/mitogen/archive/v${pkgver//_/-}.tar.gz"
	"https://patch-diff.githubusercontent.com/raw/mitogen-hq/mitogen/pull/910.patch")
arch=('any')

prepare() {
  cd "$srcdir/$pkgname-${pkgver//_/-}"
  patch -p1 < "$srcdir/910.patch"
}

build() {
  cd "$srcdir/$pkgname-${pkgver//_/-}"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-${pkgver//_/-}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

md5sums=('aa55d6974d62506d4c5d5df9743f70f1'
         '1d12b72e5258d447e11df134ab1553bc')
sha1sums=('f2d0d4c1a3756cbed14fb72130b8a05837d0c158'
          '037e65159b60782210ce3dc24a442a4eae9dc8ce')
sha256sums=('ab31dcee61b4c813424f75472194adb9641f984ee582af31bb51654be532bdd0'
            '3aabd84ee4668d708addd856454c4b58db5224f06f1bd115310d773834b3bad8')
sha384sums=('d8c3e96484e3d061748b59b2e05f417e7f73cfd277aa32e7303ab04f933513fffa404ab2dc9a84fd6c1bbce5cf333dfe'
            'bdc7cd33eabbdc2687081fa4988af3f4a56d8f2b1c6e6ffa2f69510eebfa7ec3d8615903aba62b14efdf98bd569abf2a')
sha512sums=('fce05041db55ae14adb490458c7fa91f53d0a3f0dd0ffec6dfd6ca778676fe3f5b1075aa6acd7b7a2e51264d52721b92249010a9e83f0d32e25507200ff1042e'
            '3bb5ba512e1d516b1d1117a66554c684d2668e41900ce3cda654ec620c46cd3cc778e13cfea0073c0919f5ac01324ffc102ed90e34488a2c80b4d90ce09d7a6e')
