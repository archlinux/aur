# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=qtoml
pkgname="python-${_pkgname}"
pkgver=0.3.0
pkgrel=1
pkgdesc='qtoml is another Python TOML encoder/decoder. I wrote it because I found uiri/toml too unstable, and PyTOML too slow.'
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
depends=('python' 'python-attrs' 'python-click')
makedepends=('python-pip')
source=("${_pkgname}-${pkgver}.tar.gz::https://pypi.python.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "qtoml-wrapper.py")
sha256sums=('06aac0e068d1d11c55b8c2df38625e589ad63847447fff8c53078e8d9db9935d'
            'ce8466672806fea59f8490c137b7a9d613b51b502d18a4b368d8142b20bde5e7')

package() {
  pip install \
    -I --no-deps \
    --compile \
    --root "$pkgdir" \
    "$srcdir/${_pkgname}-${pkgver}[click]"

  rm -rf "$pkgdir/usr/bin"
  install -Dm755 "$srcdir/qtoml-wrapper.py" "$pkgdir/usr/bin/qtoml"
}
