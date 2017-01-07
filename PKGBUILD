# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Daniel Maslowski <info@orangecms.org>

pkgname=minio
pkgver=2016.12.13
_pkgver='2016-12-13T17-19-42Z'
pkgrel=1
pkgdesc='Object storage server compatible with Amazon S3'
arch=('x86_64' 'i686')
url='https://minio.io'
license=('APACHE')
makedepends=('go')
depends=('glibc')
options=('!strip')
source=("https://github.com/minio/minio/archive/RELEASE.${_pkgver}.tar.gz")
sha512sums=('34c376f36e90c88ebf9d08caadc7834ac45a413be808614e8c407657c322a2cb8d09696af76a010724265798bf146a24855d817072622af89977d4063a7bcd37')

build() {
  export GOPATH=${srcdir}/go
  mkdir -p ${GOPATH}/src/github.com/minio
  mv ${srcdir}/minio-RELEASE.${_pkgver} ${GOPATH}/src/github.com/minio/minio
  cd ${GOPATH}/src/github.com/minio/minio
  go build
}

package() {
  export GOPATH=${srcdir}/go
  cd ${GOPATH}/src/github.com/minio/minio
  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
