# Maintainer: Filippo Berto <berto.f@protonmail.com>
_reponame=mini-ndn
_pkgname=mini-ndn
pkgname=${_pkgname}
pkgver=0.4.0
pkgrel=2
# epoch=
pkgdesc="Lightweight networking emulation tool that enables testing, experimentation, and research on the NDN platform based on Mininet"
arch=('i686' 'x86_64')
url="https://github.com/named-data/${_reponame}"
license=('GPL')
groups=()
depends=('boost' 'ndn-cxx' 'ndn-nfd' 'ndn-chronosync' 'ndn-tools' 'ndn-nlsr' 'ndn-infoedit' 'mininet' 'wireshark-cli' 'python2-setuptools' 'python2-pyndn')
makedepends=('boost')
checkdepends=()
optdepends=()
provides=("${pkgname}")
conflicts=("${pkgname}")
replaces=()
backup=()
options=()
install=
source=(https://github.com/named-data/${_reponame}/archive/v${pkgver}.tar.gz)
noextract=()
sha256sums=('a6abcbe022b12c540584164ab68aa69192d4e15996861df1e16fda30884f60ce')
validpgpkeys=()

build() {
  cd "${srcdir}/${_reponame}-${pkgver}"
  grep -rIil '#!.*python' . | xargs -n1 sed -i 's:#!/usr/bin/env python:#!/usr/bin/env python2:g'
  grep -rIil '#!.*python' . | xargs -n1 sed -i 's:#!/usr/bin/python:#!/usr/bin/python2:g'
  python2 setup.py build
}

package() {
	cd "${srcdir}/${_reponame}-${pkgver}"
	python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  cd "$pkgdir"
  sed -i "1i#!/usr/bin/env python2" "${pkgdir}/usr/bin/minindn"
  sed -i "1i#!/usr/bin/env python2" "${pkgdir}/usr/bin/minindnedit"
}
