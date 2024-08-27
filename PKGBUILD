# Maintainer: Jat <chat@jat.email>

pkgname=corplink-bin
pkgver=2.2.25
_pkgrel=r4432_7945e8
pkgrel=1
pkgdesc="Linux client of Feilian (veCorpLink) from Bytedance."
arch=('x86_64')
url="https://www.volcengine.com/product/feilian"
license=('unknown')
depends=('gtk3' 'libxss' 'nss' 'dnsmasq')
optdepends=('networkmanager: NetworkManager integration')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("https://cdn.isealsuite.com/linux/FeiLian_Linux_amd64_v${pkgver}_$_pkgrel.deb")
sha512sums=('cd424b9a4aea18e13a7a7c97d19bd39402a401194c01a1a44c45d3930bea963441fd8d7841568857a005759bc1b90a1e895b04bd0f3ac9518b3a8cd5cd5e3261')

package() {
  # Extract package data
  tar xpvf "${srcdir}/data.tar.xz" --xattrs-include='*' --numeric-owner -C "${pkgdir}"

  # Fix directory structure differences
  cd "${pkgdir}"
  mkdir -p usr/bin usr/lib/systemd/system
  ln -s /opt/Corplink/Corplink usr/bin/corplink
  mv "${pkgdir}"/opt/Corplink/corplink.service usr/lib/systemd/system/corplink.service

  rm -r usr/local
}
