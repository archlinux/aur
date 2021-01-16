# Maintainer: neeshy <neeshy@tfwno.gf>
_pkgname=infinityctl
pkgname="$_pkgname-git"
pkgver=latest
pkgrel=1
pkgdesc="Command line interface for 8chan"
arch=('any')
url="https://gitgud.io/ring/infinityctl"
license=('GPL3')
depends=('python' 'python-urllib3')
makedepends=('git' 'python-setuptools')
optdepends=('tesseract' 'imagemagick')
source=("git+https://gitgud.io/ring/infinityctl.git"
        "0001-Add-setup.py.patch"
        "0002-Add-unix_original-file-scrape-mode.patch"
        "0003-Fix-for-file-names-which-potentially-exceed-the-file-name-length-limit.patch"
        "0004-Remove-defunct-variants.patch"
        "0005-Use-8kun.top-addresses.patch"
        "0006-Add-variants-for-smuglo.li.patch")
sha256sums=('SKIP'
            '08f7c0c16d586732371e9448b76ad924bf3172897aa7f7bb41896c7be6fb1203'
            '53ef6c4a259c3648aeadbf3c695db72734ea824f9ba345fd4e1146d9cf76978d'
            '901ef2bee21afa0b5651fab84efa03186733b0776704acd5d123979345ee1e76'
            '48da6f8535f719ff6a07398efd433b9928285639c09922205eec436d5a72b03e'
            '9122ae8ae31b6a3be68e174bc67033dbe62da092eaa25a60e9f9850ce440cfe7'
            'afcd273106ed6584d1e843477215badea06d8729094e37721f35adad21414597')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"
  patch -Np1 -i "$srcdir/0001-Add-setup.py.patch"
  patch -Np1 -i "$srcdir/0002-Add-unix_original-file-scrape-mode.patch"
  patch -Np1 -i "$srcdir/0003-Fix-for-file-names-which-potentially-exceed-the-file-name-length-limit.patch"
  patch -Np1 -i "$srcdir/0004-Remove-defunct-variants.patch"
  patch -Np1 -i "$srcdir/0005-Use-8kun.top-addresses.patch"
  patch -Np1 -i "$srcdir/0006-Add-variants-for-smuglo.li.patch"
}

build() {
  cd "$srcdir/$_pkgname"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$_pkgname/COPYING"
}
