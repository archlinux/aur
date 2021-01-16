# Maintainer: neeshy <neeshy@tfwno.gf>
pkgname=webm
pkgver=0.12.1
pkgrel=1
pkgdesc="Cross-platform command-line WebM converter"
arch=('any')
url="https://github.com/Kagami/webm.py"
license=('custom:CC0')
depends=('python' 'ffmpeg')
optdepends=('mpv: for interactive mode')
makedepends=('python-setuptools')
source=("https://github.com/Kagami/webm.py/archive/v$pkgver.tar.gz"
        "mpv-options.patch"
        "drop-python2-support.patch")
sha256sums=('786244edc928583a49e210cbb5533d192bf9ad31bc82eb0a66d393964db119c8'
            'ddaf7c409fb7e0d6a50c638338b1d18fb2df3f7555503d6c9d0e5054703ad958'
            '70308ed9a2f0a3d9fc445fec5a8cebf8f8e7fb51686af2a9fcc77953094bce0d')

prepare() {
  cd "$srcdir/webm.py-$pkgver"
  patch -Np1 -i "$srcdir/mpv-options.patch"
  patch -Np1 -i "$srcdir/drop-python2-support.patch"
}

build() {
  cd "$srcdir/webm.py-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/webm.py-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
