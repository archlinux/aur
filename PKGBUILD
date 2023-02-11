# Maintainer: soloturn@gmail.com

pkgname=cosmic-epoch-git
pkgver=r29.18469b8
pkgrel=1
pkgdesc="pop-os cosmic desktop, version from git"
arch=('x86_64')
url="https://github.com/pop-os/cosmic-epoch"
license=(GPL)
depends=(gtk4)
makedepends=(just git meson cargo seatd mesa libpulse wayland libxkbcommon libinput dbus pop-launcher)
provides=(cosmic-epoch)
conflicts=(cosmic-epoch)
options=(!lto)
source=(
  "git+https://github.com/pop-os/cosmic-epoch.git"
  "git+https://github.com/pop-os/cosmic-session.git"
  "git+https://github.com/pop-os/cosmic-comp.git"
  "git+https://github.com/pop-os/cosmic-panel.git"
  "git+https://github.com/pop-os/cosmic-applets.git"
  "git+https://github.com/pop-os/cosmic-applibrary.git"
  "git+https://github.com/pop-os/cosmic-launcher.git"
  "git+https://github.com/pop-os/simple-wrapper.git"
  "git+https://github.com/pop-os/cosmic-settings-daemon.git"
  "git+https://github.com/pop-os/xdg-desktop-portal-cosmic.git"
  "git+https://github.com/pop-os/cosmic-osd.git"
  "git+https://github.com/pop-os/cosmic-bg.git"
  "git+https://github.com/talex5/wayland-proxy-virtwl.git"
)

sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd cosmic-epoch
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd cosmic-epoch
  git submodule init
  git config submodule.cosmic-session.url "$srcdir/cosmic-session"
  git config submodule.cosmic-comp.url "$srcdir/cosmic-comp"
  git config submodule.cosmic-panel.url "$srcdir/cosmic-panel"
  git config submodule.cosmic-applets.url "$srcdir/cosmic-applets"
  git config submodule.cosmic-applibrary.url "$srcdir/cosmic-applibrary"
  git config submodule.cosmic-launcher.url "$srcdir/cosmic-launcher"
  git config submodule.simple-wrapper.url "$srcdir/simple-wrapper"
  git config submodule.cosmic-settings-daemon.url "$srcdir/cosmic-settings-daemon"
  git config submodule.xdg-desktop-portal-cosmic.url "$srcdir/xdg-desktop-portal-cosmic"
  git config submodule.cosmic-osd.url "$srcdir/cosmic-osd"
  git config submodule.cosmic-bg.url "$srcdir/cosmic-bg"
  git config submodule.wayland-proxy-virtwl.url "$srcdir/wayland-proxy-virtwl"
  git -c protocol.file.allow=always submodule update
}


build() {
  cd cosmic-epoch
  just sysext
}

package() {
  cd cosmic-epoch
  DESTDIR="$pkgdir" just install
}
