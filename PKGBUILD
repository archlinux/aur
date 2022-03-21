# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

## Key is expired; import at your own risk
## https://github.com/thombashi.gpg

pkgname=python-humanreadable
pkgver=0.1.0
pkgrel=3
pkgdesc='Convert from human-readable values to different unit'
arch=('any')
url='https://github.com/thombashi/humanreadable'
license=('MIT')
depends=('python-typepy')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/h/humanreadable/humanreadable-$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::https://files.pythonhosted.org/packages/source/h/humanreadable/humanreadable-$pkgver.tar.gz.asc")
sha256sums=('80f10a1575ebb140d9345a347f981dc6faa70d090885490d77f63361290b4ff7'
            'SKIP')
validpgpkeys=('ACEC3954F31619D7288C17B07BAC46763C91BB7A') ## Tsuyoshi Hombashi

build() {
  cd "humanreadable-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "humanreadable-$pkgver"
  PYTHONPATH=./ pytest -x --disable-warnings
}

package() {
  export PYTHONHASHSEED=0
  cd "humanreadable-$pkgver"
  python -m installer --destdir="$pkgdir/" dist/*.whl
  install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"

  local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s \
    "$_site/humanreadable-$pkgver.dist-info/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim: ts=2 sw=2 et:
