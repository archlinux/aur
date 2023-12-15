# Contributor: Allen Zhong <allen@moe.cat>
# Maintainer: Bruce Zhang <bruceutut@aur>
pkgname=corplink-bin
pkgver=2.1.27
_pkgrel=r2711_551547
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
sha512sums=('17762c62aaa1345969f2b50cc901ecd9c21fe5c8557eab18118d21c3e31791bcebdb075fe34045074a05e9aa88edf87bf141164ee5b8bde35051454913de2a4f')

package(){
  # Extract package data
  tar xpvf "${srcdir}/data.tar.xz" --xattrs-include='*' --numeric-owner -C "${pkgdir}"

  # Fix directory structure differences
  cd "${pkgdir}"
  mkdir -p usr/bin usr/lib/systemd/system
  ln -s /opt/Corplink/Corplink usr/bin/corplink
  mv "${pkgdir}"/opt/Corplink/corplink.service usr/lib/systemd/system/corplink.service

  rm -rf usr/local
}
