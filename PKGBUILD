# Maintainer: Bram Swenson <bram+aur@craniumisajar.com>
# Maintainer: Jaroslav Bojko <echo "Ym95amFyIGF0IHNlem5hbSBkb3QgY3oK" | base64 -d>

pkgname=amazon-ecr-credential-helper
pkgver=8549783ceff8405a4dcc02689409945565c0c7ea
pkgrel=1
pkgdesc="A credential helper for the Docker daemon that makes it easier to use Amazon EC2 Container Registry."
url='https://github.com/awslabs/amazon-ecr-credential-helper'
arch=('i686' 'x86_64')
license=('MPL')
makedepends=('go' 'godep' 'git')
_gourl=github.com/awslabs
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/awslabs/amazon-ecr-credential-helper/archive/${pkgver}.tar.gz")
sha512sums=('d6693e8394262cd15bdf6b0455d0304995819bf86da4512ebaf0bc50e6343c5dd5da7f8e0d6821ed244474860fdac3990afd7fae81b89ec7b98f12e8dbd9ff28')

prepare() {
  mkdir -p "${srcdir}/src/${_gourl}"
  rm -rf "${srcdir}/src/${_gourl}/${pkgname}"
  tar -zxvf "${pkgname}-${pkgver}.tar.gz" &> /dev/null
  mv -f "${srcdir}/${pkgname}-${pkgver}" "${srcdir}/src/${_gourl}/${pkgname}"
}

build() {
  msg2 "Build program"
  cd "${srcdir}/src/${_gourl}/${pkgname}"
  GOPATH="${srcdir}" PATH="${srcdir}/bin:${PATH}" make
}

package() {
  cd "${srcdir}/src/${_gourl}/${pkgname}/bin/local"
  install -Dm755 docker-credential-ecr-login \
                 "${pkgdir}/usr/bin/docker-credential-ecr-login"
}
