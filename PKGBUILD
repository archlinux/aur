# Maintainer: duanluan <duanluan@outlook.com>

pkgname=alexandria-bin
_pkgname=alexandria
_appname=Alexandria
pkgver=0.13.2
pkgrel=1
pkgdesc='Minimalistic ebook reader (prebuilt binary)'
arch=('x86_64')
url='https://github.com/btpf/Alexandria'
license=('unknown')
depends=('gtk3' 'webkit2gtk-4.0')
provides=('alexandria')
conflicts=('alexandria')
options=('!strip')
source=("${_appname}_${pkgver}_amd64.deb::https://github.com/btpf/Alexandria/releases/download/v${pkgver}/${_appname}_${pkgver}_amd64.deb")
sha256sums=('432be51013878f884bb069482ba83c5ccecf432eab1195c6b091a94989483e07')

package() {
  local _extractdir

  _extractdir="$(mktemp -d)"
  trap 'rm -rf "${_extractdir}"' EXIT

  bsdtar -C "${_extractdir}" -xf "${srcdir}/${_appname}_${pkgver}_amd64.deb"
  bsdtar -C "${pkgdir}" -xf "${_extractdir}/data.tar.gz"

  sed -i     -e 's/^Name=.*/Name=Alexandria/'     -e 's/^Comment=.*/Comment=Minimalistic ebook reader/'     -e 's/^Categories=.*/Categories=Office;Viewer;/'     "${pkgdir}/usr/share/applications/alexandria.desktop"
}
