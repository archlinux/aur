# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=opensmtpd-filter-rspamd
_pkgname=${pkgname/opensmtpd-/}
pkgver=0.1.1+r1+gd981a92
_commit=d981a92ac1d7893cd9954f9a812170f0b267cc2d # Latest and greatest
pkgrel=1
pkgdesc='OpenSMTPD filter integration for the Rspamd daemon'
arch=(i686 x86_64)
url=https://github.com/poolpOrg/filter-rspamd
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
  install -D filter-rspamd -t "$pkgdir"/usr/bin
  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
