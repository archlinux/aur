# Maintainer: Jay Cunningham <arch at crosscompiled dot com>
pkgname=gnome-shell-extension-astra-monitor
pkgver=36
pkgrel=1
pkgdesc="Astra Monitor is a cutting-edge, fully customizable, and performance-focused system monitoring extension for GNOME's top bar"
arch=('any')
url=https://github.com/AstraExt/astra-monitor
license=('GPL3')
_file_prefix=monitor@astraext.github.io
# https://github.com/AstraExt/astra-monitor/releases/download/v34/monitor@astraext.github.io.shell-extension.zip
source=("$pkgname-v$pkgver.zip::$url/releases/download/v$pkgver/$_file_prefix.shell-extension.zip")
sha256sums=('7057d6b54814f9e14ec6c3b85a3e68de98059922fffaf0bbd51fe8e55041d491')
depends=('gnome-shell')
optdepends=('libgtop: collecting system data' 'nethogs: network I/O')

package() {
  cd "$(dirname $(find -name 'metadata.json' -print -quit))"
  _uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json) 
  _destdir="${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"

  install -d $_destdir
  bsdtar -xf $pkgname-v$pkgver.zip -C $_destdir
  glib-compile-schemas $_destdir/schemas

  find $_destdir -type f -exec chmod 644 {} +
  find $_destdir -type d -exec chmod 755 {} +
}

