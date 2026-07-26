pkgname=soundcloud-bin
pkgver=8.4.4
pkgrel=1
pkgdesc="🎵🎵🎵 THE BEST SOUNDCLOUD DESKTOP APP FOR WINDOWS, LINUX & MACOS | AI WAVE | NO ADS | NO CAPTCHA | NO RESTRICTIONS"
arch=('x86_64' 'aarch64')
url="https://github.com/zxcloli666/SoundCloud-Desktop"
license=('MIT')
depends=('webkit2gtk-4.1' 'libappindicator' 'gtk3')
backup=()
options=('!strip' '!debug')

source=("LICENSE::${url}/raw/refs/heads/main/LICENSE"
        "${pkgname%-bin}-desktop.desktop")
sha256sums=('3bed3331b7048bac17cf50e249d560ccc9508c970da8d7b9283bf4f2e633a91d'
            '123e9a1e84eec9b29106ee83de9f5d24be17659468731babe22cf1faeb89bb3b')

source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/${pkgver}/soundcloud-desktop_${pkgver}_amd64.deb")
sha256sums_x86_64=('2d614d4868dea32975bf789c1dd224a21c0bf3984029a6a7b3b7cb68f98c3016')

source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${url}/releases/download/${pkgver}/soundcloud-desktop_${pkgver}_arm64.deb")
sha256sums_aarch64=('2de9e6af32e73cfe7befe2c9fd95e306ad8b01ca3f427ba13cfee959eb1f9f5a')

build() {
  if [ "$CARCH" == "x86_64" ]; then
    ar x "${pkgname%-bin}-${pkgver}-x86_64.deb"
  elif [ "$CARCH" == "aarch64" ]; then
    ar x "${pkgname%-bin}-${pkgver}-aarch64.deb"
  fi
  tar -xf data.tar.gz
}

package() {
  install -Dm 755 "usr/bin/soundcloud-desktop" "$pkgdir/usr/bin/soundcloud-desktop"
  
  find "$srcdir/usr/share/icons" -type f | while read -r icon; do
    install -Dm 644 "$icon" "$pkgdir/${icon#$srcdir}"
  done
  
  install -Dm 644 "$srcdir/soundcloud-desktop.desktop" "$pkgdir/usr/share/applications/soundcloud-desktop.desktop"
  
  install -Dm 644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
