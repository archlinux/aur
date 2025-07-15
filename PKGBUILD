# Maintainer: Tobias Boesch <tobias.boesch at googlemail dot com>
_name=alt-profanity-check
pkgname=python-$_name
pkgver=1.7.0
pkgrel=1
pkgdesc="A fast, robust library to check for offensive language in strings, \
    dropdown replacement of \"profanity-check\"".
arch=(any)
url="https://github.com/dimitrismistriotis/alt-profanity-check"
# Upstream only signs commits, not tags. Using commit to be able to verify the source.
# https://github.com/KnossosNET/Knossos.NET/commit/9017229a93d8310e5b5a1e294e8a44bb0c86565f
_commit='9017229a93d8310e5b5a1e294e8a44bb0c86565f'
license=(MIT)
depends=(
    python
    python-setuptools
    python-joblib
    python-numpy
    'python-scikit-learn=1.7.0'
)
provides=(
    profanity-check
)
makedepends=(
    git
    python-build
    python-installer
    python-wheel
)
validpgpkeys=(
  # Fingerprint from gpg --show-keys ./keys/pgp/968479A1AFF927E37D1A566BB5690EEEBB952194.asc
  # Key from https://github.com/web-flow.gpg
  968479A1AFF927E37D1A566BB5690EEEBB952194
)
source=(
    "git+$url.git#commit=${_commit}?signed"
)
sha256sums=('SKIP')
build() {
    cd $_name
    python -m build --wheel --no-isolation
}
package() {
    cd $_name
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
