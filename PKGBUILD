# Maintainer: Aleksey Smirnov <debugger94 at gmail dot com>

_appname=throne
pkgname=$_appname-bin
pkgver=1.4.2
pkgrel=1
pkgdesc='Cross-platform GUI proxy utility (Empowered by sing-box)'
arch=(x86_64 aarch64)
url='https://throneproj.github.io'
license=(GPL-3.0-only)
optdepends=(
  'xcb-util-image: X11 image support'
  'xcb-util-keysyms: X11 keyboard keysym support'
  'xcb-util-renderutil: X11 rendering support'
  'xcb-util-wm: X11 window manager interaction support'
)
conflicts=(throne{,-git,-sysqt-bin} nekoray-mahdi-zarei-bin)
options=(!debug)
_appver=${pkgver/[a-z]/-&}
_dlurl='https://github.com/throneproj/Throne/releases/download'
source=(Throne.{desktop,sh})
source_x86_64=($_appname-$_appver-x86_64.zip::$_dlurl/$_appver/Throne-$_appver-linux-amd64.zip)
source_aarch64=($_appname-$_appver-aarch64.zip::$_dlurl/$_appver/Throne-$_appver-linux-arm64.zip)
sha256sums=('1d7019ed30127fb3c7219016ed9e08bdc4809c65af13d2b02e59eed87a69082d'
            '91adcc748f6e80b4030baeb1f4a5a5271f503cdf2cbea22733dfb297cd171f61')
sha256sums_x86_64=('e7a29891481c6f59acc3580957a34a5fd1c687cde0bc2b1ce0641176b956a7e9')
sha256sums_aarch64=('b8816d7ff470153abddd2734427e2b7e2c48a4211ecca24ba01b3d2ecf861c46')

package() {
  install -Dm755 Throne/Throne{,Core} -t "$pkgdir"/opt/Throne/

  for f in $(find Throne/usr -type f -printf "%P\n"); do
    install -Dm644 Throne/usr/$f -T "$pkgdir"/opt/Throne/usr/$f
  done

  install -Dm755 Throne.sh         -T "$pkgdir"/usr/bin/throne
  install -Dm644 Throne.desktop    -t "$pkgdir"/usr/share/applications/
  install -Dm644 Throne/Throne.png -t "$pkgdir"/usr/share/icons/hicolor/512x512/apps/
}

