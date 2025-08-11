# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
# Previous Maintainer: Ethan Skinner <aur@etskinner.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
pkgname=python-pyttsx3
_pkgname=pyttsx3
pkgver=2.99
pkgrel=1
pkgdesc="Offline text-to-speech synthesis"
arch=('any')
url="https://github.com/nateshmbhat/pyttsx3"
license=('MPL-2.0')
depends=('python')
optdepends=('espeak')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-sphinx')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('e306d551fe2dec369ab4b635367b112f64a0acf2e642c56d7f86025c1e7de436cbcfe764d93e7e53cceda0d7678824d80945cd9653baba5146832d1c69bdef28')

# https://wiki.archlinux.org/title/Python_package_guidelines#Standards_based_(PEP_517)
build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
  cd docs
  make man
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm644 "$srcdir/$_pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm 644 docs/_build/man/pyttsx3.1 -t "$pkgdir/usr/share/man/man1/"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
