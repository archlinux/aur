# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: dylan araps <dylan.araps@gmail.com>
# Contributor: mitts <mittens2001@opmbx.org>

pkgname=cydia-impactor
_pkgname=Impactor
pkgver=0.9.52
pkgrel=2
pkgdesc='A GUI tool for working with mobile devices'
arch=('i686' 'x86_64')
url='http://www.cydiaimpactor.com'
license=('unknown')
depends=('atk' 'cairo' 'fontconfig' 'freetype2' 'gdk-pixbuf2' 'gtk2' 'libsm' 'libudev0-shim' 'libx11' 'ncurses5-compat-libs' 'pango')
makedepends=('gendesk' 'libicns' 'p7zip')
source=("https://cache.saurik.com/impactor/mac/${_pkgname}_$pkgver.dmg")
source_i686=("https://cache.saurik.com/impactor/l32/${_pkgname}32_$pkgver.tgz")
source_x86_64=("https://cache.saurik.com/impactor/l64/${_pkgname}64_$pkgver.tgz")
sha256sums=('9db548074424473c5804d1118d27cd4f052db8b53b3e7c3261c1a903f521cbf1')
sha256sums_i686=('135218c123214a419b0a18dcae84ec1eeb47fa90515c509ad68aa6ec1091449f')
sha256sums_x86_64=('23b758162a34c6160021e6f82193df76bfbcc09f9476e492b76b130bb4e9e323')

build() {
  gendesk -f -n --pkgname $_pkgname --pkgdesc "$pkgdesc" --name 'Cydia Impactor' --categories 'Utility'
  7z e -y ${_pkgname}_$pkgver.dmg $_pkgname/$_pkgname.app/Contents/Resources/$_pkgname.icns || true
  icns2png -x -d 32 -s 1024 $_pkgname.icns
}

package() {
  install -Dm755 -t "$pkgdir/usr/bin" $_pkgname
  install -Dm644 -t "$pkgdir/usr/bin" $_pkgname.{dat,pem}
  install -Dm755 -t "$pkgdir/usr/lib" $_pkgname.so
  install -Dm644 -t "$pkgdir/usr/share/applications" "$_pkgname.desktop"
  install -Dm644 ${_pkgname}_1024x1024x32.png "$pkgdir/usr/share/pixmaps/$_pkgname.png"
}
