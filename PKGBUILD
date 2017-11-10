# $Id$
# Maintainer: Ido Kanner <idokan@gmail.com>
pkgname=apex-bin
_pkgname=apex
pkgdesc="Build, deploy, and manage AWS Lambda functions with ease (with Go support!)."
pkgver=0.16.0
pkgrel=2
arch=('i686' 'x86_64')
license=('MIT')
url='http://apex.run/'
provides=('apex' 'apex.run')
noextract=()
makedepends=('binutils')
source_i686=("https://github.com/apex/apex/releases/download/v${pkgver}/${_pkgname}_linux_386")
source_x86_64=("https://github.com/apex/apex/releases/download/v${pkgver}/${_pkgname}_linux_amd64")
sha256sums_i686=('82458e688d724349408d451ebfa25a7025284112264f2be6206091a9c0c1f58d')
sha256sums_x86_64=('ad1f4f8cb5577aeff84fd5edf7234fe45178811022e020cec1ae9c72ee46f79c')
if [[ "$CARCH" == "x86_64" ]]; then
  _arch="linux_amd64"
else
  _arch="linux_386"
fi

prepare() {
  mv "${_pkgname}"_"${_arch}" "$_pkgname"
  strip "$_pkgname"
}

package() {
  mkdir -p "$pkgdir"/usr/bin
  install -Dm0755 "$_pkgname" "$pkgdir"/usr/bin
}
