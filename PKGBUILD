# Maintainer: Jat <chat@jat.email>

pkgname=corplink-bin
pkgver=3.1.18
_pkgrel=r6560_8a2fab
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
sha512sums=('e6d2415ae8c972daeccdf3a43344284c7ba0a5fabbfe736d0c2f61463042b7871bb6f9bb94ac2f56b86cb0b6fe83fe6865c63222850ede790215f09ed70d7899')

package() {
  # Extract package data
  tar xpvf "${srcdir}/data.tar.xz" --xattrs-include='*' --no-same-owner -C "${pkgdir}"

  # Fix directory structure differences
  cd "${pkgdir}"
  mkdir -p usr/bin usr/lib/systemd/system
  ln -s /opt/apps/com.volcengine.feilian/files/corplink usr/bin/corplink
  mv "${pkgdir}"/opt/apps/com.volcengine.feilian/files/corplink.service usr/lib/systemd/system/corplink.service

  rm -r usr/local
}
