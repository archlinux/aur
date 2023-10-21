# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: ganymede

pkgname=skdet
pkgver=1.0
pkgrel=2
pkgdesc="Simple rootkit detector that can be used by rkhunter"
arch=(x86_64 i686)
url="https://dvgevers.home.xs4all.nl"
license=(GPL)
depends=(glibc)
source=(
  "https://dvgevers.home.xs4all.nl/$pkgname/$pkgname-$pkgver.tar.bz2"
  "https://dvgevers.home.xs4all.nl/$pkgname/$pkgname-fix-includes.diff"
  "ldflags.patch"
)
sha256sums=(
  'a5842d3e56c8586c52879700453f740744c374a1f2c648eef337cae7e244e7b6'
  '1ee83c1122dfe74c8aec7800fe0026affda6ea37c7643491fd8df62f08ed2fbc'
  '51ae92ef28fcc7603d00769b412f74bf7873c0d196be03b14bbed0b8c11ec331'
)

_archive="$pkgname-$pkgver"

prepare() {
  cd "$_archive"

  patch -N -p1 -i "$srcdir/skdet-fix-includes.diff"
  patch -N -p1 -i "$srcdir/ldflags.patch"
}

build() {
  cd "$_archive"

  rm skdet
  make
}

package() {
  cd "$_archive"

  install -dm 755 "$pkgdir/usr/bin"
  install -dm 755 "$pkgdir/usr/share/doc/$pkgname-$pkgver"
  install -m 755 "$pkgname" "$pkgdir/usr/bin/"
  install -m 644 AUTHORS "$pkgdir/usr/share/doc/$pkgname-$pkgver/"
  install -m 644 ChangeLog "$pkgdir/usr/share/doc/$pkgname-$pkgver/"
  install -m 644 CONTRIBUTIONS "$pkgdir/usr/share/doc/$pkgname-$pkgver/"
  install -m 644 CREDITS "$pkgdir/usr/share/doc/$pkgname-$pkgver/"
  install -m 644 README "$pkgdir/usr/share/doc/$pkgname-$pkgver/"
}
