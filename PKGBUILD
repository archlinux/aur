# Maintainer: Samim Pezeshki (psamim) <psamim@gmail.com>

_pkgname=KTOP
pkgname=ktop-git
pkgver=1.5.1b.r37.gd0c148b
pkgrel=1
pkgdesc='Make Persian EPUBs compatible to E-Readers such as Kindle'
url='https://github.com/al1b/KTOP'
license=('GPL3')
source=('git+https://github.com/al1b/KTOP.git' 'ktop')
sha256sums=('SKIP'
            '15190d1c90ea9bc363104e62a321b6c01e46b1a6df22a59bdd8436b4dd2e05e4')
arch=('any')
depends=('dotnet-sdk')
makedepends=('git')
conflicts=('ktop')
provides=('ktop')
install=$pkgname.install

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"
  dotnet restore
  cd 'src/KTOP.CLI'
  dotnet publish -c Release
}

package() {
  install  -d "${pkgdir}/usr/share/${_pkgname}"
  cp -ar "${srcdir}/${_pkgname}/src/KTOP.CLI/bin/Release/netcoreapp1.1/publish/." "${pkgdir}/usr/share/${_pkgname}"
  install -Dm755 "${srcdir}/ktop" "${pkgdir}/usr/bin/ktop"
}
