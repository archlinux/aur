# Maintainer: Julian Raufelder <arch@raufelder.com>

pkgname=libjffi
pkgver=1.3.10
pkgrel=1
pkgdesc='Java bindings for libffi'
arch=('any')
url='https://github.com/jnr/jffi'
license=('APACHE')
depends=('libffi')
makedepends=('ant' 'maven' 'make' 'gcc')
provides=('libjffi.so')
source=("https://github.com/jnr/jffi/archive/refs/tags/jffi-$pkgver.tar.gz")

sha256sums=('41958e4e38dcc5339389d8f8fc98c446a72890927948e890b9a94bb3f8af1ecc')

build() {
  cd "jffi-jffi-${pkgver}"
  ant jar && ant archive-platform-jar && mvn package
}

package() {
  install -Dm 644 "${srcdir}/jffi-jffi-${pkgver}/target/jni/${CARCH}-Linux/${pkgname}-1.2.so" -t "${pkgdir}/usr/lib/"
  install -Dm 644 "${srcdir}/jffi-jffi-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
