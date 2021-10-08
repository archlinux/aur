# Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>

pkgname=tbb-combo-native-agent
# peres -v TbbComboNativeAgentHost.exe | grep 'Product Version' | cut -f 2 -d : | sed 's# ##g'
pkgver=1.0.0.12
pkgrel=1
pkgdesc='Taiwan Business Bank combo native agent (臺灣企銀二合一元件)'
arch=(any)
url='https://webatm.post.gov.tw/'
license=(unknown)
depends=(wine-winscard lib32-gnutls)
makedepends=(p7zip gendesk)
source=("Install_TbbComboNativeAgentHost-$pkgver.exe"::"https://ebank.tbb.com.tw/nb3/COMPONENT/component_download?componentPath=win&trancode=ComponentDownload"
        "$pkgname")
sha256sums=('60220263043e71cfd20d2618d6a4be8834f76fc0e251e6b96f6a46b376a68028'
            'd53b1fa92ef27d426a390a6d1b56a0096bdfc37a60bc9700e79c7d982796994c')

prepare() {
  7z x Install_TbbComboNativeAgentHost-$pkgver.exe
}

build() {
  gendesk -n --pkgname "$pkgname" \
    --name "Taiwan Business Bank combo native agent" \
    --icon /usr/share/pixmaps/TbbComboNativeAgentHost.ico \
    --categories "Office;Finance"
  # No direct support for translations https://github.com/xyproto/gendesk/issues/15
  echo "Name[zh_TW]=臺灣企銀二合一元件" >> $pkgname.desktop
}

package() {
  install -Dm755 $pkgname -t "$pkgdir"/usr/bin
  install -Dm644 TbbComboNativeAgentHost.exe -t "$pkgdir"/usr/share/$pkgname
  install -Dm644 $pkgname.desktop -t "$pkgdir"/usr/share/applications
  install -Dm644 TbbComboNativeAgentHost.ico -t "$pkgdir"/usr/share/pixmaps
}
