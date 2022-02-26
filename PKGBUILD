# Maintainer:   Sian1468 <setthawut DOT a AT protonmail DOT com>
# Contributor:  Julien Nicoulaud <julien DOT nicoulaud AT gmail DOT com>

pkgname=ffmpeg-normalize
pkgver=1.22.7
pkgrel=1
pkgdesc="Audio normalization using ffmpeg."
arch=(any)
url="https://github.com/slhck/ffmpeg-normalize"
license=(MIT)
depends=('ffmpeg' 'python-ffmpeg-progress-yield')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha512sums=('0667e82191fd01a5563acd0c31c79a6ada2ffde879c3ea56d8a22d4c929a856e68406fd57315a66fdd870b9966c4a24281015aab1a2d5ae981129fdecd05001a')

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
