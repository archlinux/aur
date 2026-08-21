# Maintainer: Jat <chat@jat.email>

pkgname=corplink-bin
pkgver=3.2.16
_pkgrel=r8362_0d182a
pkgrel=1
pkgdesc="Linux client of Feilian (veCorpLink) from Bytedance."
arch=('x86_64')
url="https://www.volcengine.com/product/feilian"
license=('unknown')
depends=('gtk3' 'libxss' 'nss' 'dnsmasq' 'iw')
optdepends=('networkmanager: NetworkManager integration')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("https://cdn.isealsuite.com/linux/FeiLian_Linux_amd64_v${pkgver}_$_pkgrel.deb")
sha512sums=('129731f371215d1ef2f15a7746c7bd16404e1e4ba287d5f238d1bc240e3b279214e3b15a6468d674b0127f533e03a31e496e1ed301701075ca4320a1c7016e1e')

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
