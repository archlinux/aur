# Maintainer: Maciej Sieczka <msieczka at sieczka dot org>

pkgname='singularity-container'
pkgver='3.0.0'
pkgrel='1'
pkgdesc='Container platform focused on supporting "Mobility of Compute".'
arch=('i686' 'x86_64')
url='https://www.sylabs.io/singularity/'
license=('BSD')
makedepends=('go' 'dep')
depends=('squashfs-tools')
source=("https://github.com/sylabs/singularity/releases/download/v${pkgver}/singularity-v${pkgver}.tar.gz")
noextract=("singularity-v${pkgver}.tar.gz")
md5sums=('019afc549c838ff08cabffe094c194b9')

prepare() {
  mkdir -p "${srcdir}/src/github.com/sylabs"
  tar -zxf singularity-v${pkgver}.tar.gz -C "${srcdir}/src/github.com/sylabs"
}

build() {
  export GOPATH="${srcdir}"
  cd "${srcdir}/src/github.com/sylabs/singularity"
  ./mconfig -p /usr
  cd builddir
  make
}

package() {
  export GOPATH="${srcdir}"
  cd "${srcdir}/src/github.com/sylabs/singularity/builddir"
  make PREFIX="${pkgdir}/usr" install
  chmod 755 "${pkgdir}/usr/bin/singularity"
}

