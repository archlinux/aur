pkgname=soundcloud-bin
pkgver=7.5.0
pkgrel=1
pkgdesc="🎵🎵🎵 THE BEST SOUNDCLOUD DESKTOP APP FOR WINDOWS, LINUX & MACOS | AI WAVE | NO ADS | NO CAPTCHA | NO RESTRICTIONS"
arch=('x86_64' 'aarch64')
url="https://github.com/zxcloli666/SoundCloud-Desktop"
license=('MIT')
depends=('webkit2gtk-4.1' 'libappindicator' 'gtk3')
backup=()
options=('!strip' '!debug')

source=("LICENSE::${url}/raw/refs/heads/main/LICENSE")
sha256sums=('3bed3331b7048bac17cf50e249d560ccc9508c970da8d7b9283bf4f2e633a91d')

source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/${pkgver}/soundcloud-desktop_${pkgver}_amd64.deb")
sha256sums_x86_64=('3083b0baa3065419d927351b7d456c3282173ca960b7e9ef5178624795cab675')

source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${url}/releases/download/${pkgver}/soundcloud-desktop_${pkgver}_arm64.deb")
sha256sums_aarch64=('41eea6e4aa981683b14c546d068fbb5f1949268e7287392c91cc6043614ca745')

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
  
  install -Dm 644 "$srcdir/usr/share/applications/soundcloud-desktop.desktop" "$pkgdir/usr/share/applications/soundcloud-desktop.desktop"
  sed -i 's/^Name=.*/Name=SoundCloud Desktop/' "$pkgdir/usr/share/applications/soundcloud-desktop.desktop"
  
  install -Dm 644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
