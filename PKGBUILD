# Maintainer: Arne Brücher <archlinux [at] arne-bruecher [dot] de>

pkgname=black-pearl-origin-git
_realname=black-pearl-origin
pkgver=r491.83a4bc6
pkgrel=1
pkgdesc='Free and open-source tool for managing game sources using community-made modules.'
arch=('x86_64')
url='https://github.com/BlackPearlOrigin/blackpearlorigin'
license=('BSD')
depends=('libayatana-appindicator' 'webkit2gtk' 'gtk3' 'openssl-1.1')
makedepends=('git' 'yarn' 'rust' 'webkit2gtk')
provides=('black-pearl-origin')
conflicts=('black-pearl-origin')
source=(git+$url)
sha256sums=('SKIP')

pkgver() {
  cd blackpearlorigin
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build () {
   cd "$srcdir/blackpearlorigin"
   yarn install
   yarn tauri build --bundles deb
}

package () {
   install -Dv "$srcdir/blackpearlorigin/src-tauri/target/release/$_realname" "$pkgdir/usr/bin/$_realname"
   cd "$srcdir/blackpearlorigin/src-tauri/target/release/bundle/deb/black-pearl-origin_1.2.0_amd64/data"
   install -Dv "./usr/share/applications/$_realname.desktop" "$pkgdir/usr/share/applications/$_realname.desktop"
   install -Dv "./usr/share/icons/hicolor/32x32/apps/$_realname.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/$_realname.png"
   install -Dv "./usr/share/icons/hicolor/128x128/apps/$_realname.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/$_realname.png"
   install -Dv "./usr/share/icons/hicolor/256x256@2/apps/$_realname.png" "$pkgdir/usr/share/icons/hicolor/256x256@2/apps/$_realname.png"
}
