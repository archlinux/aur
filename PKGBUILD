# Maintainer: Franck Stauffer <franck.stauffer@monaco.mc>
# Contributor: GI_Jack <iamjacksemail@hackermail.com>
# Contributor: Xavier Devlamynck <magicrhesus@ouranos.be>

pkgname=sipvicious
pkgver=0.3.2
pkgrel=1
pkgdesc="Set of security tools that can be used to audit SIP based VoIP systems"
arch=('any')
url="https://github.com/EnableSecurity/sipvicious"
license=('GPL3')
depends=('python>=3.6')
optdepends=('python-scapy: allow svcrash to crash SIPVicious toolset')
makedepends=('python-setuptools')
changelog=$pkgname.changelog
source=("$pkgname-$pkgver.tar.gz::https://github.com/EnableSecurity/sipvicious/archive/v$pkgver.tar.gz")
b2sums=('ba17173ebbfff312483671c4875234e3a78540f31981ee16326bdb1e2295a370eaa84307131f000c6edf9cb7c3258d351742caf7def1bf6cc60a6bee0f96a451')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  sed -i "s/sipvicious_//" setup.py
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python setup.py install -O2 --skip-build --root="$pkgdir"

  for man in man1/*; do
      install -Dvm644 $man "$pkgdir/usr/share/man/man1/$man"
  done
}
