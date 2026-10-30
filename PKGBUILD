# Maintainer: w568w <w568w at outlook dot com>

pkgname=qqtui-bin
pkgver=0.1.5
pkgrel=1
pkgdesc='Terminal frontend using the native Linux QQ service'
arch=('x86_64')
url='https://github.com/w568w/qqtui'
license=('MPL-2.0')
depends=('glibc' 'libgcc' 'sqlite>=3.51.2' 'systemd' 'dbus' 'xorg-server-xvfb'
         'xorg-xauth' 'xorg-xkbcomp' 'tigervnc' 'novnc'
         'linuxqq=5:3.2.35_54395')
optdepends=('kitty: inline images and animations'
            'noto-fonts-cjk: Chinese text in the terminal and QQ login page'
            'firefox: browser for first login (other graphical browsers also work)'
            'wl-clipboard: Wayland clipboard'
            'xclip: X11 clipboard'
            'xdg-utils: open files and links in external applications')
provides=("qqtui=$pkgver")
conflicts=('qqtui')
options=('!strip')
source=("$url/releases/download/v$pkgver/qqtui-$pkgver-linux-$CARCH.tar.gz")
sha256sums=('1bdc59f91c3173eee53d700943b6e242dd67bf351c94250969114eac4d380547')

package() {
  cd "qqtui-$pkgver-linux-$CARCH"
  install -Dm755 qqtui "$pkgdir/usr/bin/qqtui"
  install -Dm644 packaging/systemd/qqtui-host.service \
    "$pkgdir/usr/lib/systemd/user/qqtui-host.service"
  install -Dm644 packaging/systemd/qqtui-host@.service \
    "$pkgdir/usr/lib/systemd/user/qqtui-host@.service"
  local doc
  for doc in README.md CONTRIBUTING.md docs/*.md bridge/compatibility.json; do
    install -Dm644 "$doc" "$pkgdir/usr/share/doc/qqtui/$doc"
  done
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/qqtui/LICENSE"
  ln -s ../../licenses/qqtui/LICENSE "$pkgdir/usr/share/doc/qqtui/LICENSE"
}
