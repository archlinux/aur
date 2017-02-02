# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=nemo-fileroller
pkgname=nemo-engrampa
_mintrel='betsy'
pkgver=3.2.1
pkgrel=1
pkgdesc="Archive management plugin for Nemo using engrampa"
arch=('i686' 'x86_64')
url="https://github.com/linuxmint/nemo-extensions"
license=('GPL2')
depends=('nemo>=3.2' 'engrampa')
makedepends=()
options=('!libtool' '!emptydirs')

source=("${pkgname}-${pkgver}.tar.gz::http://packages.linuxmint.com/pool/main/${_pkgname:0:1}/${_pkgname}/${_pkgname}_${pkgver}+${_mintrel}.tar.gz")
sha256sums=('6acef5e3d1f11500e8315641ddba40d02fb4117de9c5cca1b8156e70a2a4fdd7')

build() {
  cd ${_pkgname}-${pkgver}+${_mintrel}

  cd src
  for file in *fileroller* ; do
    mv "${file}" "${file/fileroller/engrampa}"
  done
  cd ..
  find . -type f -exec sed -i -E \
    -e 's:file[\ \-]?roller:engrampa:g' \
    -e 's:File[\ \-]?[rR]oller:Engrampa:g' '{}' \;

  autoreconf -fi

  PYTHON=python2 ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd ${_pkgname}-${pkgver}+${_mintrel}

  make DESTDIR="${pkgdir}" install
}
