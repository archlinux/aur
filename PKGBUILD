# Maintainer Ruijie Yu <first DOT last@outlook DOT com>
pkgname=bass-fish
_pkgname=bass
pkgver=1.0
pkgrel=1
pkgdesc='Make Bash utilities usable in Fish shell'
url="https://github.com/edc/$_pkgname"
arch=(any)
license=(MIT)
depends=(fish)
optdepends=()
makedepends=()
checkdepends=(
    python
)
source=(
    "$url/archive/v$pkgver.tar.gz"
)

b2sums=(SKIP)

_extracted="$_pkgname-$pkgver"
_fish_vendor_func="usr/share/fish/vendor_functions.d/"
_license_dir="usr/share/licenses/$pkgname/"
_doc_dir="usr/share/doc/$pkgname/"

check() {
    _test_path="$srcdir/$_extracted/test"
    fish "$_test_path/test_bass.fish" &&
        fish "$_test_path/test_dollar_on_output.fish"
}

package() {
    install -dm0755 \
        "$pkgdir/$_fish_vendor_func" \
        "$pkgdir/$_license_dir" \
        "$pkgdir/$_doc_dir"

    install -Dm0644 \
        "$srcdir/$_extracted/functions/__bass.py" \
        "$srcdir/$_extracted/functions/bass.fish" \
        "$pkgdir/$_fish_vendor_func"

    install -Dm0644 \
        "$srcdir/$_extracted/LICENSE" \
        "$pkgdir/$_license_dir"

    install -Dm0644 \
        "$srcdir/$_extracted/README.md" \
        "$pkgdir/$_doc_dir"
}

