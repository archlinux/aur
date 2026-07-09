# Maintainer: Qontinuum <qontinuum.dev@protonmail.ch>
# Contributor: Network_Jack <Network_Jack@null.net>
# Contributor: Xavier Devlamynck <magicrhesus@ouranos.be>

pkgname=sipvicious
pkgver=0.3.7
pkgrel=1
pkgdesc="Set of security tools that can be used to audit SIP based VoIP systems"
arch=('any')
url="https://github.com/EnableSecurity/sipvicious"
license=('GPL3')
depends=('python>=3.6')
optdepends=('python-scapy: allow svcrash to crash SIPVicious toolset')
makedepends=('python-build' 'python-installer' 'python-wheel')
changelog=$pkgname.changelog
source=("$pkgname-$pkgver.tar.gz::https://github.com/EnableSecurity/sipvicious/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('1c309a2aa996c5e34d2be85d459e4f47280467bc7178518767832bea9c55c85d9b22fff78f815cd7677eeaa882bf70955139e334ddf7a604bc62a37b6bfaaac6')


prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  sed -i "s/sipvicious_//" setup.py
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
