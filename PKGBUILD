# Maintainer: Alexander Konarev <avkonarev@gmail.com>

pkgname=yandex-browser
pkgver=15.9.2403.2150_1.beta
pkgrel=3
pkgdesc="The web browser from Yandex (beta version!).
 It's browser that combines a minimal design with sophisticated technology to make the web faster, safer, and easier."
arch=('x86_64')
url='http://browser.yandex.ru/beta/'
license=('custom')
options=(!strip)
depends=('gconf' 'alsa-lib'  'cairo' 'libcap' 'libcups' 'libdbus' 'expat' 'fontconfig' 'freetype2' 'gcc-libs'  'gdk-pixbuf2' 'glib2'  'gtk2' 'nspr'  'nss'  'pango'  'libx11' 'libxcomposite' 'libxcursor' 'libxdamage' 'libxext' 'libxfixes' 'libxi'  'libxkbfile' 'libxrandr' 'libxrender' 'libxss' 'libxtst' 'ca-certificates'  'curl' 'ld-lsb' 'xdg-utils' 'wget' 'libudev.so.0')
optdepends=('chromium-pepper-flash: plugin for viewing flash videos')
makedepends=('xz')
conflicts=('yandex-browser-beta')
install='yandex-browser.install'
source=("$pkgname.deb::http://browser.yandex.ru/download/?beta=1&os=linux&x64=1&package=deb&full=1")
md5sums=('SKIP')

pkgver(){
  cd "$srcdir"
  tar -xvzf control.tar.gz > /dev/null
  echo "$(cat control | grep ^Version: | cut -d' ' -f2 | tr '-' '_')".beta
}

prepare() {
  cd "$srcdir"
  tar -xpJf data.tar.xz
}

package() {
  mkdir -p "$pkgdir"/usr/lib/pepperflashplugin-nonfree/
  ln -s /usr/lib/PepperFlash/libpepflashplayer.so "$pkgdir"/usr/lib/pepperflashplugin-nonfree/libpepflashplayer.so
  cd "$srcdir"
  cp -r opt usr "$pkgdir"
}

