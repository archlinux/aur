# Maintainer: Qontinuum <qontinuum.dev@protonmail.ch>
# Contributor: Network_Jack <Network_Jack@null.net>
# Contributor: Xavier Devlamynck <magicrhesus@ouranos.be>

pkgname=sipvicious
pkgver=0.3.4
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
b2sums=('75f3d190cb4224ada84cd7c714eb545e44a9759589890a559d3cb5243c5430c0aa81138e3cd294926901e961a5ec156c8d991b648c70e1d8fc2dc906473d507d')

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
