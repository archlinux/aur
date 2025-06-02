# Maintainer: Richard Garber <rg.1029384756@gmail.com>

pkgname=yaacs
pkgver=2.0.1
pkgrel=1
pkgdesc="Convert your Audiobooks to Opus in parallel"
url="https://github.com/rgarber11/yaacs"
arch=('any')
license=(GPL-2.0-only)
# NOTICE: The number of dependencies we rely on is *very high*. If the program does not run after an upgrade, make sure all your deps are upgraded, especially AUR deps!
depends=('python>=3.9' 'ffmpeg' 'python-packaging' 'python-mutagen')

makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-lark-parser')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('203598524844af0055f4c247730f8d2cfeb7592716a406100ddb0800e56226fd')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}" || exit
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
