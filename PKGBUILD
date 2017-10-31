# $Id$
# Maintainer: Ido Kanner <idokan@gmail.com>
pkgname=apex-bin
_pkgname=apex
pkgdesc="Build, deploy, and manage AWS Lambda functions with ease (with Go support!)."
pkgver=0.16.0
pkgrel=1
arch=('1686' 'x86_64')
license=('MIT')
url='http://apex.run/'
provides=('apex' 'apex.run')
noextract=()
makedepends=('binutils')
if [[ "$CARCH" == "x86_64" ]]; then
  sha256sums=('ad1f4f8cb5577aeff84fd5edf7234fe45178811022e020cec1ae9c72ee46f79c')
  _arch="linux_amd64"
else
  sha256sums=('82458e688d724349408d451ebfa25a7025284112264f2be6206091a9c0c1f58d')
  _arch="linux_386"
fi
source=("https://github.com/apex/apex/releases/download/v${pkgver}/${_pkgname}_${_arch}")


prepare() {
  mv "${_pkgname}"_"${_arch}" "$_pkgname"
  strip "$_pkgname"
}

package() {
  mkdir -p "$pkgdir"/usr/bin
  install -Dm0755 "$_pkgname" "$pkgdir"/usr/bin
}
