# Maintainer:   Sian1468 <setthawut DOT a AT protonmail DOT com>

pkgname=ffmpeg-progress-yield
pkgver=0.0.3
pkgrel=1
pkgdesc="Run an ffmpeg command with its progress yielded."
arch=(any)
url="https://github.com/slhck/ffmpeg-progress-yield"
license=(MIT)
depends=(ffmpeg python-tqdm python-colorama)
makedepends=(python-setuptools)
conflicts=("${pkgname}-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha512sums=('a24d80c2589292e1324080c793187757e09697512420017327be8e6cb713c903b9407764bec7aaaa74cf749848790cfd4ddf7534ae9b80df94540515590ee91d')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}
check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python test/test.py
}
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
