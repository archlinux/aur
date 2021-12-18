# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='python-pagesign'
_pkgname="${pkgname#python-}"
pkgver=0.1.0
pkgrel=1
pkgdesc='Python library to wrap age and minisign to provide key management, encryption/decryption and signing/verification functionality'
arch=('any')
license=('BSD')
url='https://docs.red-dove.com/pagesign/'
wheel="${_pkgname}-$pkgver-py2.py3-none-any.whl"
source=(
  "https://files.pythonhosted.org/packages/py2.py3/${_pkgname::1}/$_pkgname/$wheel"
)
depends=(
  'age'
  'minisign'
  'python'
)
makedepends=(
  'python-pip'
)
sha256sums=(
  '6f346769cb53265e7bbfbd53338105c4358a8a9e5846edd0defa948009829550'
)
sha512sums=(
  '890907428f10a79742d9880ee7ca020903e9c2b30f06585ab1284ae03c15f026268e495b6731fd167af3385838e8974f8387a0538b7aadc2a6e187e75c257179'
)
b2sums=(
  '1f94b0cca8ccbb23af500e039642731bec0a2d48d71f64fb046e312ae29eed69f0e724e3ffc6fa63b16b47ec513ec9f2faf01733554274f79b74d080bc52407f'
)

package() {
  umask 0022

  pip install \
    --force-reinstall \
    --ignore-installed \
    --no-warn-script-location \
    --no-deps \
    --compile \
    --root="$pkgdir" \
    --prefix='/usr' \
      "$srcdir/$wheel"

  install -Dm0644 "$srcdir/$_pkgname-$pkgver.dist-info/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

# eof
