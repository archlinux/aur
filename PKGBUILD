# Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>

pkgname=tbb-combo-native-agent
pkgver=1.0.0.13
pkgrel=1
pkgdesc='Taiwan Business Bank combo native agent (臺灣企銀二合一元件)'
arch=(any)
url='https://ebank.tbb.com.tw/'
license=(unknown)
depends=(wine-winscard lib32-gnutls lib32-pcsclite)
makedepends=(p7zip gendesk pev)
source=("Install_TbbComboNativeAgentHost-$pkgver.exe"::"https://ebank.tbb.com.tw/nb3/COMPONENT/component_download?componentPath=win&trancode=ComponentDownload"
        "$pkgname")
sha256sums=('cede47f11b90a296b9b33b4201a65655135572d763f3dd95648cb74f420900bb'
            'd53b1fa92ef27d426a390a6d1b56a0096bdfc37a60bc9700e79c7d982796994c')

prepare() {
  7z x Install_TbbComboNativeAgentHost-$pkgver.exe
}

pkgver() {
  peres -v TbbComboNativeAgentHost.exe | grep 'Product Version' | cut -f 2 -d : | sed 's# ##g'
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
