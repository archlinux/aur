# Maintainer: Chih-Hsuan Yen <base64_decode("eXUzYWN0eHQydHR0ZmlteEBjaHllbi5jYwo=")>

pkgname=tbb-combo-native-agent
pkgver=1.0.0.16
pkgrel=2
pkgdesc='Taiwan Business Bank combo native agent (臺灣企銀二合一元件)'
arch=(any)
url='https://ebank.tbb.com.tw/'
license=(unknown)
depends=(gnutls pcsclite sh wine)
makedepends=(p7zip gendesk perl-image-exiftool)
source=("Install_TbbComboNativeAgentHost-$pkgver.exe"::"https://ebank.tbb.com.tw/nb3/COMPONENT/component_download?componentPath=win&trancode=ComponentDownload"
        "$pkgname")
sha256sums=('2c8b0e8747aa36b115cfebbdfe9c3ed401003303fb3b8e87402b8b918f0460a1'
            'd53b1fa92ef27d426a390a6d1b56a0096bdfc37a60bc9700e79c7d982796994c')

prepare() {
  7z x Install_TbbComboNativeAgentHost-$pkgver.exe
}

pkgver() {
  # Credit: https://askubuntu.com/a/717855
  exiftool -ProductVersion TbbComboNativeAgentHost.exe | cut -f 2 -d : | sed 's# ##g'
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
