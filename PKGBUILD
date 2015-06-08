# Maintainer: Sid Karunaratne <sid at karunaratne dot net>
pkgname=elastic-mapreduce
pkgver=20140722
pkgrel=1
pkgdesc="a pure Ruby client for the Amazon Elastic MapReduce Web Service."
arch=('any')
url="https://github.com/tc/elastic-mapreduce-ruby"
license=('APACHE')
source=("http://elasticmapreduce.s3.amazonaws.com/${pkgname}-ruby.zip"
        "${pkgname}")
noextract=("${pkgname}-ruby.zip")
sha256sums=('df1d718383a1f0c4680dcc1d1b553bfe25d0892e09ed85f8e0dbb1a3ce66aa1e'
            'fdafdd3394bda33837898414c9880a35850c8070a51e4297d82832908002035a')
depends=(ruby1.8)
makedepends=(unzip)
install=install

build() {
  cd "${srcdir}"
  mkdir extracted
  unzip "${pkgname}-ruby.zip" -d extracted
  sed -i 's#/usr/bin/env ruby#/usr/bin/env ruby-1.8#' "extracted/${pkgname}"
}


package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}/usr/local/"
  cp -r extracted "${pkgdir}/usr/local/${pkgname}"
  install -Dm 755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
