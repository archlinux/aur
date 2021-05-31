# Maintainer: GeorgeRaven <GeorgeRavenCommunity at pm dot me>
pkgname=cni-bin
pkgdesc="Standardised container networking interface"
pkgver=0.9.1
pkgrel=1
arch=('x86_64' 'aarch64' 'armv7h' 'armv7l')
url="https://www.cni.dev/"
license=('apache')
conflicts=('cni')
provides=("cni=${pkgver}")
source=()
sha256sums=()

case "$CARCH" in
  arm*) _pkgarch="arm"
    sha256sums+=('909e800d01cc61ffa26f2629e4a202a58d727e6ccaabd0310ef18d2b1e00943c')
    ;;
  aarch64) _pkgarch="arm64"
    sha256sums+=('ef17764ffd6cdcb16d76401bac1db6acc050c9b088f1be5efa0e094ea3b01df0')
    ;;
  x86_64) _pkgarch="amd64"
    sha256sums+=('962100bbc4baeaaa5748cdbfce941f756b1531c2eadb290129401498bfac21e7')
    ;;
esac

source+=(${pkgname}-${pkgver}::"https://github.com/containernetworking/plugins/releases/download/v${pkgver}/cni-plugins-linux-${_pkgarch}-v${pkgver}.tgz")

package() {
  cd "${srcdir}"
  # get rid of unwanted link
  unlink "${pkgname}-${pkgver}"
  # install to default location
  mkdir -p "${pkgdir}/opt/cni/bin" "${pkgdir}/usr/lib/cni"
  install -Dm755 "${srcdir}/"* "${pkgdir}/opt/cni/bin/."
  # also deposit bins in alternate possible location
  install -Dm755 "${srcdir}/"* "${pkgdir}/usr/lib/cni"
}
