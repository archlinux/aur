# Maintainer: noraj <printf %s 'YWxleGFuZHJlLnphbm5pQGV1cm9wZS5jb20='|base64 -d>

pkgname=chapter_converter
pkgver=1.2.1
pkgrel=1
pkgdesc='Convert between several different video chapter file formats.'
arch=('any')
url='https://github.com/fireattack/chapter_converter'
license=('MIT')
depends=('python' 'python-chardet' 'python-pyperclip')
makedepends=('python-build' 'python-pip')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha512sums=('e182a5b5aa225c6e84ec817509fae9769d8676270796a0ff9793eb2484c292d3056281726032e62fb87ffeab94454f2d36b323abe0e2b0cf54d1d613818b60b2')

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

