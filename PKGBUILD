# Maintainer: qaz <fkxxyz@163.com>
# Contributor: qaz <fkxxyz@163.com>

pkgname=feem
pkgver=4.4.2
pkgrel=1
pkgdesc="Share Files in LAN. OFFLINE! No Cloud. No Servers. No Limits."
arch=("x86_64")
url="https://www.feem.io/"
license=('custom')
makedepends=('p7zip')
depends=('qt5-webkit' 'hicolor-icon-theme')
optdepends=('gstreamer: multimedia support')
source=(
  "https://f000.backblazeb2.com/file/feemdownloads/Feem-${pkgver}-x86_64.AppImage"
)

prepare() {
  cd "${srcdir}"
  7z x -y "Feem-${pkgver}-x86_64.AppImage"
}

package() {
  cd "${srcdir}"

  install -d "${pkgdir}/usr/share"

  cp -a ./usr/share/icons "${pkgdir}/usr/share/icons"
  cp -a ./usr/share/applications "${pkgdir}/usr/share/applications"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} \;

  install -D ./usr/bin/Feem "${pkgdir}/usr/bin/feem"

  install -d "${pkgdir}/usr/share/licenses/$pkgname"
  echo '

© FeePerfect. All rights reserved.

Created By Fritz Ekwoge
From the beautiful city of Buea, Cameroon.

About Us
	We are FeePerfect. A small, high-tech company providing innovative ideas 
	for people and businesses. We are based in Cameroon, Africa. Our award 
	winning products help people solve problems that they deal with each and 
	every day. We will always work hard to please our customers and are always 
	happy to do business with you.

Send us an email: info@feeperfect.com and we''ll be glad to help.
' > "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
sha256sums=('3934df10fae0b93fc975ffdda462e82022252ea7c684114628cbce28cb775e8a')
