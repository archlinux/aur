# Maintainer: Eric Busch <me@etbus.ch>
pkgname=python-stpyv8
pkgver=13.1.201.22
pkgrel=1
pkgdesc="Python 3 / V8 JavaScript engine interoperability (successor to PyV8), used by pypkjs for Pebble phone-simulator JS execution"
arch=('x86_64')
url="https://github.com/cloudflare/stpyv8"
license=('Apache-2.0')
depends=('python')
makedepends=('python-installer')

# stpyv8 has no real sdist: it embeds a prebuilt V8 checkout and only
# ships platform/CPython-ABI-specific wheels (see cloudflare/stpyv8).
# This vendors the manylinux wheel matching Arch's current python
# (cp314 as of this writing). It WILL need pkgver/source/sha256 bumped
# to a matching wheel whenever Arch's system python moves to a new
# minor version and upstream has published one for it.
_whl="stpyv8-$pkgver-cp314-cp314-manylinux_2_35_x86_64.whl"
source=("https://files.pythonhosted.org/packages/ad/4e/d002dd7a724d64571c161b1f1b3f3258066becd666b0f5233a7b519a6432/$_whl")
sha256sums=('c0b258c7c5a79c5f19e636b93eece90d3cf9109af9a11c5394bdb807ed68e04a')

package() {
  python -m installer --destdir="$pkgdir" "$_whl"
  install -Dm644 "$pkgdir"/usr/lib/python*/site-packages/stpyv8-*.dist-info/licenses/LICENSE.txt \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
