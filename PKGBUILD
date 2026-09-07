pkgname=pipixiv-bin
pkgver=2.4.0
pkgrel=1
pkgdesc="一个使用Compose Multiplatform开发的第三方Pixiv客户端，支持国内直连"
arch=('x86_64')
url="https://github.com/darriousliu/PiPixiv"
license=('MIT')
options=(!debug)
depends=('glibc' 'gcc-libs' 'glib2' 'gtk3' 'libx11' 'libxcb' 'freetype2' 'fontconfig' 'mesa-utils')
source=("https://github.com/darriousliu/PiPixiv/releases/download/v$pkgver/PiPixiv-v$pkgver-linux-x86_64.tar.gz")
sha256sums=('f9cffdffc0ba0f0671c61f03cc296fefff16923632a22ac62a153fe1b0650088')

package() {
  cd "$srcdir"

  install -d "$pkgdir/opt/$pkgname"
  cp -r PiPixiv/* "$pkgdir/opt/$pkgname/"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/bin/PiPixiv" "$pkgdir/usr/bin/PiPixiv"

  install -d "$pkgdir/usr/share/applications"
  cat > "$pkgdir/usr/share/applications/pipixiv.desktop" << EOF
[Desktop Entry]
Name=PiPixiv
Comment=Pixiv Client
Exec=/opt/$pkgname/bin/PiPixiv
Icon=/opt/$pkgname/lib/PiPixiv.png
Terminal=false
Type=Application
Categories=Graphics;
StartupWMClass=PiPixiv
EOF
}