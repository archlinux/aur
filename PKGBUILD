# Maintainer: Julian Raufelder <arch@raufelder.com>

pkgname=libjffi
pkgver=1.4.1
pkgrel=1
pkgdesc='Java bindings for libffi'
arch=('any')
url='https://github.com/jnr/jffi'
license=('APACHE')
depends=('libffi')
makedepends=('ant' 'maven' 'make' 'gcc')
provides=('libjffi.so')
source=("https://github.com/jnr/jffi/archive/refs/tags/jffi-$pkgver.tar.gz")

sha256sums=('2c60fe5628814bbcca41921dd5d69e6678c3ebb79d4ca2e90c6a4344b25c2f18')

build() {
  cd "jffi-jffi-${pkgver}"
  ant jar && ant archive-platform-jar && mvn package
}

package() {
  install -Dm 644 "${srcdir}/jffi-jffi-${pkgver}/target/jni/${CARCH}-Linux/${pkgname}-1.2.so" -t "${pkgdir}/usr/lib/"
  install -Dm 644 "${srcdir}/jffi-jffi-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
