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
    "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
)

b2sums=('b2f9e0489f27c22354c8e2a23f5e499bbf54166737a989bd754afa3e22c433a20df7df1708d1a8c59d549bbcf67dadb72632554beec353d3105b74204b2334e9')

_extracted="$_pkgname-$pkgver"
_fish_vendor_func="usr/share/fish/vendor_functions.d/"
_license_dir="usr/share/licenses/$pkgname/"
_doc_dir="usr/share/doc/$pkgname/"

check() {
    make -C "$srcdir/$_extracted" test # call test target from upstream
}

package() {
    install -Dm0644 \
            "$srcdir/$_extracted/functions/__bass.py" \
            "$srcdir/$_extracted/functions/bass.fish" \
            -t "$pkgdir/$_fish_vendor_func/"

    install -Dm0644 \
            "$srcdir/$_extracted/LICENSE" \
            -t "$pkgdir/$_license_dir/"

    install -Dm0644 \
            "$srcdir/$_extracted/README.md" \
            -t "$pkgdir/$_doc_dir/"
}

