# Maintainer: bendork <bendik.lynghaug@gmail.com>

pkgbase=kanidm-bin
pkgname=(kanidm-bin kanidm-unixd-bin kanidmd-bin)
pkgver=1.10.4
pkgrel=1
pkgdesc='Modern identity management platform (prebuilt binaries)'
arch=(x86_64 aarch64)
url='https://kanidm.com'
license=('MPL-2.0')

_publisher=bendik/kanidm

source_x86_64=("kanidm-v${pkgver}-x86_64-linux-gnu.tar.gz::https://github.com/${_publisher}/releases/download/v${pkgver}-bin/kanidm-v${pkgver}-x86_64-linux-gnu.tar.gz")
source_aarch64=("kanidm-v${pkgver}-aarch64-linux-gnu.tar.gz::https://github.com/${_publisher}/releases/download/v${pkgver}-bin/kanidm-v${pkgver}-aarch64-linux-gnu.tar.gz")
sha256sums_x86_64=('2f7bc8ec1a7313cb913e4b571a01c78667c72438d694c104bb41c944cbdc0ef5')
sha256sums_aarch64=('ae914587e5c6da9b292ba702158a8136d929fa95285ff0fcc2a91995a6aef073')

_srcdir() {
  if [[ $CARCH == x86_64 ]]; then echo "kanidm-v${pkgver}-x86_64-linux-gnu"
  else echo "kanidm-v${pkgver}-aarch64-linux-gnu"; fi
}

package_kanidm-bin() {
  pkgdesc='Kanidm command-line client (prebuilt binaries)'
  depends=(glibc gcc-libs openssl sqlite)
  provides=(kanidm "kanidm=${pkgver}")
  conflicts=(kanidm)
  local src; src=$(_srcdir)
  install -Dm755 "${srcdir}/${src}/bin/kanidm"                        "${pkgdir}/usr/bin/kanidm"
  install -Dm755 "${srcdir}/${src}/bin/kanidm_ssh_authorizedkeys_direct" \
                 "${pkgdir}/usr/bin/kanidm_ssh_authorizedkeys_direct"
}

package_kanidm-unixd-bin() {
  pkgdesc='Kanidm UNIX integration daemons (prebuilt; PAM/NSS modules not included)'
  depends=(glibc gcc-libs openssl sqlite pam dbus libcap tpm2-tss systemd-libs)
  provides=(kanidm-unixd "kanidm-unixd=${pkgver}")
  conflicts=(kanidm-unixd)
  local src; src=$(_srcdir)
  install -Dm755 "${srcdir}/${src}/bin/kanidm_unixd"             "${pkgdir}/usr/sbin/kanidm_unixd"
  install -Dm755 "${srcdir}/${src}/bin/kanidm_unixd_tasks"       "${pkgdir}/usr/sbin/kanidm_unixd_tasks"
  install -Dm755 "${srcdir}/${src}/bin/kanidm_ssh_authorizedkeys" \
                 "${pkgdir}/usr/bin/kanidm_ssh_authorizedkeys"
  install -Dm755 "${srcdir}/${src}/bin/kanidm-unix"              "${pkgdir}/usr/bin/kanidm-unix"
}

package_kanidmd-bin() {
  pkgdesc='Kanidm server daemon (prebuilt binary)'
  depends=(glibc gcc-libs openssl sqlite tpm2-tss systemd-libs libcap)
  provides=(kanidmd "kanidmd=${pkgver}")
  conflicts=(kanidmd)
  local src; src=$(_srcdir)
  install -Dm755 "${srcdir}/${src}/bin/kanidmd" "${pkgdir}/usr/bin/kanidmd"
}
