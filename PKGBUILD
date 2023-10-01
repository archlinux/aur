# Maintainer: noraj <printf %s 'YWxleGFuZHJlLnphbm5pQGV1cm9wZS5jb20='|base64 -d>

pkgname=chapter_converter
pkgver=1.2.0
pkgrel=1
pkgdesc='Convert between several different video chapter file formats.'
arch=('any')
url='https://github.com/fireattack/chapter_converter'
license=('MIT')
depends=('python' 'python-chardet' 'python-pyperclip')
makedepends=('python-build' 'python-pip')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha512sums=('7371744542def96b542944095f4a23bd0739f310cf68628db969fea9ecfef8b65799f241456aa2c5cd76d93b065aab1dc836c7d8201d3cda3bba32c9cf3457be')

build() {
  cd "$pkgname-$pkgver"

  python -m build --wheel --outdir="$startdir/dist"
}

package() {
  cd "$pkgname-$pkgver"

  pip install \
    --verbose \
    --disable-pip-version-check \
    --no-warn-script-location \
    --ignore-installed \
    --no-compile \
    --no-deps \
    --root="$pkgdir" \
    --prefix=/usr \
    --no-index \
    --find-links="file://$startdir/dist" \
    $pkgname
}

