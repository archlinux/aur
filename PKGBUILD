# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=opensmtpd-filter-senderscore
_pkgname=${pkgname/opensmtpd-/}
pkgver=0.1.0+r2+gf828d6b
_commit=f828d6b6bad971fa8b196b1d13416835fb353ef5 # Latest and greatest
pkgrel=1
pkgdesc='OpenSMTPD filter integration for the SenderScore reputation'
arch=(i686 x86_64)
url=https://github.com/poolpOrg/filter-senderscore
license=(ISC)
depends=(glibc)
makedepends=(git go)
source=(git+$url#commit=$_commit)
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's#-#+#g;s#+#+r#'
}
  
build() {
  cd $_pkgname
  go build
}

package() {
  cd $_pkgname
  install -D filter-senderscore -t "$pkgdir"/usr/bin
  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
