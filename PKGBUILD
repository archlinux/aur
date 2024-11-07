# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
pkgname=python-about-time
_pkgname=about-time
pkgver=4.2.1
pkgrel=4
pkgdesc='Easily measure timing and throughput of code blocks, with beautiful human friendly representations.'
arch=('any')
url='https://github.com/rsalmei/about-time'
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha512sums=('9fe0b488e9a2f6cfa2e20c80e4ba580651e396733ce60a8b51a8b782111ae314768d21a9f539b078781f669a408897b209de9da20e8f9fc70cce23326b589d73')

# https://wiki.archlinux.org/title/Python_package_guidelines#Standards_based_(PEP_517)
build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm644 "$srcdir/$_pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

