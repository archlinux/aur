# Maintainer: Julian Raufelder <arch@raufelder.com>

pkgname=libjffi
pkgver=1.3.9
pkgrel=1
pkgdesc='Java bindings for libffi'
arch=('any')
url='https://github.com/jnr/jffi'
license=('APACHE')
depends=('libffi')
makedepends=('ant' 'maven' 'make' 'gcc')
provides=('libjffi.so')
source=("https://github.com/jnr/jffi/archive/refs/tags/jffi-$pkgver.tar.gz")

sha256sums=('dca22a2d72eae96a3dd5ad15520ef7bbc04cd7c2a443e08e3ac457c85e4b3311')

build() {
  cd "jffi-jffi-${pkgver}"
  ant jar && ant archive-platform-jar && mvn package
}

package() {
  install -Dm 644 "${srcdir}/jffi-jffi-${pkgver}/target/jni/${CARCH}-Linux/${pkgname}-1.2.so" -t "${pkgdir}/usr/lib/"
  install -Dm 644 "${srcdir}/jffi-jffi-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
