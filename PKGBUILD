# Maintainer: Sabart Otto - Seberm <seberm[at]gmail[dot].com
# Contributor: Uzsolt
 
pkgname=simple-tpm-pk11-git
_gitname=simple-tpm-pk11

pkgver=0.02.2.g7bf168f
pkgrel=1
pkgdesc="Simple PKCS11 provider for TPM chips. GIT version."
url="http://blog.habets.se/2013/11/TPM-chip-protecting-SSH-keys---properly"
arch=('any')
license=('APACHE')
depends=('tpm-tools' 'opencryptoki')
optdepends=()
conflicts=()
provides=('simple-tpm-pk11')
makedepends=('git')
source=("git+https://github.com/ThomasHabets/simple-tpm-pk11.git")
 
md5sums=('SKIP')
 

pkgver() {
  cd ${_gitname}
  git describe --tags | sed -E 's/\([\^\-\]\*-g\)/r/;s/-/./g;s/simple\.tpm\.pk11.//g'
}

prepare() {
  cd ${_gitname}
  ./bootstrap.sh
}

build() {
  cd ${_gitname}
  ./configure -prefix=/usr
  make
}

package() {
  cd ${_gitname}
  make DESTDIR=${pkgdir} install
}

 
