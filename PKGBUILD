# Maintainer: Jat <chat@jat.email>

pkgname=corplink-bin
pkgver=3.0.16
_pkgrel=r4659_fb1fd4
pkgrel=3
pkgdesc="Linux client of Feilian (veCorpLink) from Bytedance."
arch=('x86_64')
url="https://www.volcengine.com/product/feilian"
license=('unknown')
depends=('gtk3' 'libxss' 'nss' 'dnsmasq')
optdepends=('networkmanager: NetworkManager integration')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("https://cdn.isealsuite.com/linux/FeiLian_Linux_amd64_v${pkgver}_$_pkgrel.deb")
sha512sums=('36303fa7941c8896b29b84c5dafd80a6edccb900427267098336b7d452e68d5c89e44a63d48b0569a29a6b249d9ee732be95cf40d989fe7388d569e52e86362f')

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
