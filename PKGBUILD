# Maintainer: Franck Stauffer <franck.stauffer@monaco.mc>
# Contributor: GI_Jack <iamjacksemail@hackermail.com>
# Contributor: Xavier Devlamynck <magicrhesus@ouranos.be>

pkgname=sipvicious
pkgver=0.3.3
pkgrel=1
pkgdesc="Set of security tools that can be used to audit SIP based VoIP systems"
arch=('any')
url="https://github.com/EnableSecurity/sipvicious"
license=('GPL3')
depends=('python>=3.6')
optdepends=('python-scapy: allow svcrash to crash SIPVicious toolset')
makedepends=('python-setuptools')
changelog=$pkgname.changelog
source=("$pkgname-$pkgver.tar.gz::https://github.com/EnableSecurity/sipvicious/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('4ef872ecea9113f3ec24df98133230f678ccfff24380c2fafff810a4cbc3e2fe26866deb3595a7540cd42d34fd5bc045e6a2f51c7eb6403a445f33acd74e2213')

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
