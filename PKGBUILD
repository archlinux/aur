# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=nemo-fileroller
pkgname=nemo-engrampa
_mintrel='betsy'
pkgver=3.6.0
pkgrel=1
pkgdesc="Archive management plugin for Nemo using engrampa"
arch=('i686' 'x86_64')
url="https://github.com/linuxmint/nemo-extensions"
license=('GPL2')
depends=('nemo>=3.2' 'engrampa')
options=('!libtool' '!emptydirs')
#source=("${_pkgname}-${pkgver}.tar.gz::http://packages.linuxmint.com/pool/main/${_pkgname:0:1}/${_pkgname}/${_pkgname}_${pkgver}+${_mintrel}.tar.gz")
source=("nemo-extensions-$pkgver.tar.gz::https://github.com/linuxmint/nemo-extensions/archive/$pkgver.tar.gz")
sha256sums=('593aaf206ef50a8185e1f71c9018ce6a8b4bcb82b4684494e069f9045ba11fd1')

build() {
  #cd ${_pkgname}-${pkgver}+${_mintrel}
  cd "${srcdir}/nemo-extensions-${pkgver}/${_pkgname}"

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
  #cd ${_pkgname}-${pkgver}+${_mintrel}
  cd "${srcdir}/nemo-extensions-${pkgver}/${_pkgname}"

  make DESTDIR="${pkgdir}" install
}
