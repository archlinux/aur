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
source=("git+https://gitgud.io/ring/infinityctl"
        "0001-Add-setup.py.patch"
        "0002-Add-unix_original-file-scrape-mode.patch"
        "0003-Fix-for-file-names-which-potentially-exceed-the-file.patch"
        "0004-Remove-defunct-variants.patch"
        "0005-Use-8kun.top-addresses.patch"
        "0006-Add-variants-for-smuglo.li.patch")
sha256sums=('SKIP'
            'd07d1e661e9361eae4d9ef181fed0b41ef1c0f726cb77cd1374b71e470ecfcda'
            '6e511397568acc0a619f73243cf2a52ac306557d9da93cb90a420a6550f059c8'
            '45763115641e5616b17bf2a6d8e791889852c8de0a16364769658af0ec06bcdd'
            '794d37c153946095b7ef67d17ac9c2adc848b4babad37f013edec9ff0d0dc6e4'
            'a2414a02188f1824733d6d0e78ad8d98b16f902a0cbc6ba4f821d48d56112f9a'
            'fa4bb1349955b94f3ca1d1577e3811496c6de360fd93b86bcec3814c30c67a9d')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"
  patch -Np1 -i "$srcdir/0001-Add-setup.py.patch"
  patch -Np1 -i "$srcdir/0002-Add-unix_original-file-scrape-mode.patch"
  patch -Np1 -i "$srcdir/0003-Fix-for-file-names-which-potentially-exceed-the-file.patch"
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
