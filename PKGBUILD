pkgname=soundcloud-bin
pkgver=8.4.3
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
sha256sums_x86_64=('465abc12a1b9eeecc5d65b147c994a1cc0f62ff9c67e44e3a00a7f408296d832')

source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${url}/releases/download/${pkgver}/soundcloud-desktop_${pkgver}_arm64.deb")
sha256sums_aarch64=('271e3bc69a151824e054e19d23b5077a1799588195a625ad8f17e9288056e677')

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
