# Maintainer: William Turner <willtur.will@gmail.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=afdko
pkgver=3.0.1
pkgrel=1
pkgdesc='Tools used by Adobe font developers for wrapping up PostScript fonts as OpenType/CFF font files'
arch=('x86_64')
url="https://github.com/adobe-type-tools/$pkgname"
license=('custom')
_py_deps=('booleanoperations' 'defcon' 'fontparts' 'fontmath' 'fonttools' 'mutatormath' 'wheel' 'ufonormalizer')
depends=('python' "${_py_deps[@]/#/python-}")
depends_x86_64=('lib32-glibc')
conflicts=("$pkgname-git")
source=("https://github.com/adobe-type-tools/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('f0a60d919e555388b417e43ce9019f3e43c869f120e311d50d3c7004edcfc482')

build() {
    cd "$pkgname-$pkgver"
    python setup.py -q build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py -q install --root="$pkgdir" --optimize=1
    install -D -m644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
