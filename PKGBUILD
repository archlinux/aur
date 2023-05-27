# Maintainer: Arne Brücher <archlinux [at] arne-bruecher [dot] de>

pkgname=project-black-pearl-git
_realname=project-black-pearl
pkgver=r348.cc2818f
pkgrel=2
pkgdesc='Free and open-source tool for managing game sources using community-made modules.'
arch=('x86_64')
url='https://github.com/ProjectBlackPearl/project_black_pearl'
license=('BSD')
depends=('libayatana-appindicator' 'webkit2gtk-4.1' 'gtk3' 'openssl-1.1')
makedepends=('git' 'yarn')
provides=('project-black-pearl')
conflicts=('project-black-pearl')
source=(git+https://github.com/ProjectBlackPearl/project_black_pearl)
sha256sums=('SKIP')

pkgver() {
  cd project_black_pearl
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build () {
   cd "$srcdir/project_black_pearl"
   yarn install
   yarn tauri build --bundles deb
}

package () {
   install -Dv "$srcdir/project_black_pearl/src-tauri/target/release/$_realname" "$pkgdir/usr/bin/$_realname"
   cd "$srcdir/project_black_pearl/src-tauri/target/release/bundle/deb/project-black-pearl_0.3.0_amd64/data"
   install -Dv "./usr/share/applications/$_realname.desktop" "$pkgdir/usr/share/applications/$_realname.desktop"
   install -Dv "./usr/share/icons/hicolor/32x32/apps/$_realname.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/$_realname.png"
   install -Dv "./usr/share/icons/hicolor/128x128/apps/$_realname.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/$_realname.png"
   install -Dv "./usr/share/icons/hicolor/256x256@2/apps/$_realname.png" "$pkgdir/usr/share/icons/hicolor/256x256@2/apps/$_realname.png"
}
