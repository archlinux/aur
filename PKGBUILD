# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
pkgname=python-about-time
_pkgname=about-time
pkgver=4.2.2
pkgrel=2
pkgdesc='Easily measure timing and throughput of code blocks, with beautiful human friendly representations.'
arch=('any')
url='https://github.com/rsalmei/about-time'
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$url/archive/refs/tags/v$pkgver.tar.gz"
        "pyproject.patch")
sha512sums=('beb8e0c123d3b63515cb91fc0a4081b8fb1bbcc391d7d24b0a2eddbb45712050da0a02d3d07b1158a8f454b677ac7f2fd5f1db3f60f6529662baca1223edd42b'
            'cf5ac507ffcd5d8a01d6b6f3ef26eb08bd82c26a71f6cb50ae369545a7bf2e27cb1cefa7531ca81816bcf81ecc935f0f1d43135bfc849fbe73fb060da8d72bcd')

# https://wiki.archlinux.org/title/Patching_packages
prepare() {
    patch -d $_pkgname-$pkgver -Np1 -i ../pyproject.patch
}

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

