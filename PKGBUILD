# Maintainer: hansel <58466533+JHXs@users.noreply.github.com>

pkgname=tomatodo-bin
pkgver=1.7.0
pkgrel=1
pkgdesc='Todo and Pomodoro timer desktop application'
arch=('x86_64')
url='https://pc.fanqietodo.cn/'
license=('LicenseRef-proprietary')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'expat'
  'glib2'
  'glibc'
  'gtk3'
  'libcups'
  'libdrm'
  'libnotify'
  'libsecret'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'libxss'
  'libxtst'
  'mesa'
  'nspr'
  'nss'
  'pango'
  'util-linux-libs'
  'xdg-utils'
)
optdepends=('libappindicator: system tray integration')
provides=("tomatodo=$pkgver")
conflicts=('tomatodo')
options=('!debug' '!strip')
source=(
  "$pkgname-$pkgver.deb::https://down.fanqietodo.cn/TomaToDo-linux.deb"
)
noextract=("$pkgname-$pkgver.deb")
sha256sums=('6ade4ef8ef001942d845b64e3893b3ba5c282c61a6bc40c4c629240515dc1899')

# The download server rejects requests without the website as the Referer.
DLAGENTS=(
  'https::/usr/bin/curl -qgb "" -fLC - --retry 3 --retry-delay 3 -e https://pc.fanqietodo.cn/ -o %o %u'
)

package() {
  bsdtar -xOf "$srcdir/$pkgname-$pkgver.deb" data.tar.xz |
    bsdtar --no-same-owner -xJf - -C "$pkgdir"

  install -d "$pkgdir/usr/bin"
  ln -s '/opt/番茄ToDo/tomatodo' "$pkgdir/usr/bin/tomatodo"

  chmod 4755 "$pkgdir/opt/番茄ToDo/chrome-sandbox"
}
