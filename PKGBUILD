# Maintainer: redfish <redfish@galactica.pw>

pkgname=stemns
_name=StemNS
_commit=68d437491c0308545e149181768cd98e45c1ac82
_height=33
pkgver=0.0.0.r${_height}.g${_commit:0:6}
pkgrel=1

pkgdesc='Tor plugin for resolving names using Stem'
url='https://github.com/namecoin/StemNS'
arch=(x86_64 armv7h)
license=(Unlicense BSD)

depends=('python-stem')
optdepends=(
	'tor: anonymizing overlay network'
)
makedepends=()
install=stemns.install

source=($pkgname-${_commit}.tar.gz::https://github.com/namecoin/StemNS/archive/${_commit}.tar.gz
        stemns.service
        stream-id.patch)

prepare() {
  cd $srcdir/$_name-$_commit
  patch -p1 < $srcdir/stream-id.patch
}

package() {
  install -Dm 644 -t "$pkgdir/usr/lib/systemd/system/" stemns.service
  cd $srcdir/$_name-$_commit
  install -Dm 644 -t "$pkgdir/opt/$pkgname" *.py
  install -Dm 644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}

sha512sums=('74fbab5a741a77ab13419620a970ce75517bbf81392bdac2fb174ab6547ae7ce624d9112d533bf1d48a8af0abb5926606f4fe2ce3ecccd551aad8d37d0324cf2'
            '75bc2987995aed6143a44677908f847d7537c6c1870263a92b7ac16a0c40f779391a7442c40a7815dba8f18e16e75dd2957a285e2d13076c9c93439b06294e39'
            '28b4b4f91b290c2b8c791ba5cf7b81d5bc15327d01383d71e77c92d3f15314b5a8d49c9810c4f33c38fdea6514f1789dbb9faecc66adade62b95439d2131294b')
