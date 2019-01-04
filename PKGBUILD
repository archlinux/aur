# Maintainer: Maciej Sieczka <msieczka at sieczka dot org>

pkgname='singularity-container'
pkgver='3.0.2'
pkgrel='1'
pkgdesc='Container platform focused on supporting "Mobility of Compute".'
arch=('i686' 'x86_64')
url='https://www.sylabs.io/singularity/'
license=('BSD')
makedepends=('go' 'dep')
depends=('squashfs-tools')
source=("https://github.com/sylabs/singularity/releases/download/v${pkgver}/singularity-${pkgver}.tar.gz")
noextract=("singularity-${pkgver}.tar.gz")
md5sums=('2f49faa5c6685b28e0124959d0e796a2')

prepare() {
  export GOPATH="${srcdir}/singularity"
  mkdir -p "${GOPATH}/src/github.com/sylabs"
  tar -zxf singularity-${pkgver}.tar.gz -C "${GOPATH}/src/github.com/sylabs"
}

build() {
  export GOPATH="${srcdir}/singularity"
  cd "${GOPATH}/src/github.com/sylabs/singularity"
  ./mconfig -p /usr
  cd builddir
  make
}

package() {
  export GOPATH="${srcdir}/singularity"
  cd "${GOPATH}/src/github.com/sylabs/singularity/builddir"
  make PREFIX="${pkgdir}/usr" install
}
