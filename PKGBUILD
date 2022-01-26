# Maintainer:   Sian1468 <setthawut DOT a AT protonmail DOT com>
# Contributor:  Julien Nicoulaud <julien DOT nicoulaud AT gmail DOT com>

pkgname=ffmpeg-normalize
pkgver=1.22.5
pkgrel=1
pkgdesc="Audio normalization using ffmpeg."
arch=(any)
url="https://github.com/slhck/ffmpeg-normalize"
license=(MIT)
depends=('ffmpeg' 'python-ffmpeg-progress-yield')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha512sums=('082ac38b4237b4b669fd83486b5ed2cb59653982b3c530dee874d093798733786723896bdaea6e0e6a7effddf9cfbd23074f7aa658c9ef49968b4dc8e081e80e')

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
