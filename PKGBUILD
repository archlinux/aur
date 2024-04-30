# Maintainer: Jat <chat@jat.email>

pkgname=corplink-bin
pkgver=2.2.18
_pkgrel=r3691_1f41c8
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
sha512sums=('4e9327fb468515e8c14888bc0f19c5748a8c99426a08eca802ccd81cc46bff70b6791ccf76da2d0715553a889d4b863c323c1a3650d34a9f1119874c9273faf7')

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
