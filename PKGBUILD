pkgname=python-frozen-flask
pkgver=1.0.1
pkgrel=1
pkgdesc='Freezes a Flask application into a set of static files'
url='https://github.com/Frozen-Flask/Frozen-Flask'
license=('BSD')
arch=('any')
depends=('python' 'python-flask')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("https://github.com/Frozen-Flask/Frozen-Flask/archive/refs/tags/v${pkgver}.tar.gz"
	"https://patch-diff.githubusercontent.com/raw/Frozen-Flask/Frozen-Flask/pull/137.patch")

prepare() {
  cd "$srcdir/Frozen-Flask-${pkgver}"
  # Fix Hatchling compatibility
  patch -p1 < "$srcdir/137.patch"
}

build() {
  cd "$srcdir/Frozen-Flask-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/Frozen-Flask-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

md5sums=('08c11707ad05945951be7a4dd1331de2'
         'ad1b6974a80138c55acdc5e49d89192e')
sha1sums=('0fa90ccab5a707c155adefc6b7ea93bb18e6064c'
          '469ebcb12900dd099a0a1cfc64a51d0e05bb12c7')
sha256sums=('0243957980224073c1897799d4cbe8c9f2b871568c335faf62f7acff56763794'
            '4369537106eb36e98e642b81b14e59f81ab621a0b2608d15243a959b229a7a1a')
sha384sums=('d5d6d8379d3e7b2677de3f901cdd0b25d873a224e7c3965dce1cb9ab53ee6beee1b9ce4b265dad08d0574a0e189cc7c2'
            '1e01ce46368ef90ad8cb3f312f83d2e85651ff508a271db40b04e3af4413d575c0e00e79d2dd4f54f24af6353dd6c64e')
sha512sums=('2eb282b6f9ca2b14e967b9e6a45b750ccd302c2048a9928655334efa145c65f3290ba939b00a4e3014e6ea1b1d3897ca00248e9db215369f2568119a87254424'
            'c646a088171e7aa816428cfafb26097625ff400dc256f499a5ba31b85c32d688975cc939c2e8f9486c65f7c490a93154f5c221cfe4aad2af949e2d54af898c3c')
