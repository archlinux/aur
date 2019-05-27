pkgname=mitogen
pkgver=0.2.7
pkgrel=1
pkgdesc="Distributed self-replicating programs in Python"
license=("BSD")
url="https://mitogen.readthedocs.io/"
depends=('python')
makedepends=('python-setuptools')
optdepends=('ansible: for using the ansible strategy plugin')
source=("https://github.com/dw/mitogen/archive/v${pkgver}.tar.gz"
        "issue587.patch")
arch=('any')

# branch snapshot fixes incompatibilities with ansible v2.8
prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 < "$srcdir/issue587.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

md5sums=('b21b4cb198143e7cf98089597e9af237'
         'bf062429e804d86cfb2d93f4fb8e045f')
sha1sums=('096ca59a8d5a96f9d579840940ca9edfa0abdcb7'
          '63cab394110c84b27dceed3ed424b3ab7bdc9e69')
sha256sums=('ecc861794577963fc7b703b2fa03a3aff3e02ab94d09d870465413ac7bea9934'
            'fb62e672ae12e67b4b895a4867db766c93092b58ef895c6de52904d7b49edacb')
sha384sums=('ffce55e4737b5654fc1990770c10d06a493a9804582fe4f3563ca5f210b5cafb224b702ddf432f32b921f12cfd07465c'
            '0f23ab92f36b578abfcca0d0fb74a50d1d9efc83878cd50009d5e6cac7b9eb5dbd3412184b0bd173f0a2303442193120')
sha512sums=('463a311b4c4c8285da582f7cb92b322c42107d6b4a906b2dc0221ba7e9620312f9b30ddf718c39d925be7985df9b7e830b1d864e39c758db3e443e83e33ee9e5'
            '0fc09e417de2a2603ae84464515fddd9a67548fdaf15de2ab31961c20bcff61cb64f48142628339e7075667b4670aa7ac79db793dc5dfe86c645ef723bddcb32')
