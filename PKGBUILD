# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname=bedtools-git
pkgver=v2.26.0.r148.gd1953b65
pkgrel=1
pkgdesc="A powerful toolset for genome arithmetic."
arch=('i686' 'x86_64')
url=https://github.com/arq5x/"${pkgname//-git/}"2
license=('GPL2')
depends=('bash' 'zlib')
provides=('bedtools-git')
conflicts=('bedtools-git')
source=(git+https://github.com/arq5x/"${pkgname//-git/}"2.git)
md5sums=('SKIP')

pkgver() {
  cd "${pkgname//-git/}"2
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}"/"${pkgname//-git/}"2
  make
}

check()
{
  cd "${srcdir}"/"${pkgname//-git/}"2
  make test
}

package()
{
  cd "${srcdir}"/"${pkgname//-git/}"2
  for file in bin/*
  do
      install -Dm755 "${file}" "${pkgdir}"/usr/bin/$(basename ${file})
  done
}
