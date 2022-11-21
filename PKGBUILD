# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Bruno Pagani <archange@archlinux.org>

_pkg=smbprotocol
pkgname=python38-${_pkg}
pkgver=1.9.0
pkgrel=1
pkgdesc="SMBv2 and v3 client"
arch=(any)
url="https://github.com/jborean93/smbprotocol"
license=(MIT)
depends=(python38-cryptography python38-pyspnego python38-six)
makedepends=(git python38-setuptools)
checkdepends=(python38-pytest python38-pytest-mock python38-gssapi)
optdepends=('python38-gssapi: Kerberos support')
# tags are not signed, commits only
_commit=ad98d67392e43a84f9c906ecd610d60627b1b87d # git rev-parse v${pkgver}
#source=(git+${url}.git#commit=${_commit}?signed)
# 1.9.0 was signed using GitHub key
source=(git+${url}.git#commit=${_commit})
sha256sums=(SKIP)
validpgpkeys=(A03A0E13C2EFFD384B1EC39A2AAC89085FBBDAB5) # Jordan Borean <jborean93@gmail.com>

build() {
  cd ${_pkg}
  python3.8 setup.py build
}

check() {
  cd ${_pkg}
  pytest -vv --color=yes
}

package() {
  cd ${_pkg}
  python3.8 setup.py install --prefix=/usr --root="${pkgdir}" --skip-build --optimize=1
  install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}
}
