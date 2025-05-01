# Maintainer: Sherlock Holo <sherlockya at gmail.com>

pkgname=void-bin
pkgver=1.99.30001
pkgrel=3
arch=('x86_64')
options=('!strip')
url="https://github.com/voideditor/binaries"
license=('APACHE')
depends=('alsa-lib' 'atk' 'at-spi2-core' 'glibc' 'cairo' 'dbus' 'expat' 'mesa' 'glib2' 'gtk3' 'nspr' 'nss' 'pango' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'xdg-utils')
source=("https://github.com/voideditor/binaries/releases/download/${pkgver}/Void-linux-x64-${pkgver}.tar.gz" 'void.desktop')
md5sums=('69c1c2224e773cf542381bb5b0d40869'
         '5d9b92526f6bfe8a74ccd81c127ef83f')

package() {
  mkdir -p "$pkgdir/opt/void"
  tar -xzf "${srcdir}/Void-linux-x64-${pkgver}.tar.gz" -C "$pkgdir/opt/void"

  mkdir -p $pkgdir/usr/bin/
  ln -sf /opt/void/void $pkgdir/usr/bin/void

  mkdir -p $pkgdir/usr/share/zsh/site-functions/
  ln -sf /opt/void/resources/completions/zsh/_void $pkgdir/usr/share/zsh/site-functions/_void

  mkdir -p $pkgdir/usr/share/applications/
  install -Dm644 void.desktop $pkgdir/usr/share/applications/

  mkdir -p $pkgdir/usr/share/pixmaps
  install -Dm644 $pkgdir/opt/void/resources/app/resources/linux/code.png $pkgdir/usr/share/pixmaps/void.png
}
