pkgname=wayland-push-to-talk-fix-git
pkgver=r18.fecb045
pkgrel=2
pkgdesc="This fixes the inability to use push to talk in Discord when running Wayland"
arch=('x86_64')
url="https://github.com/Rush/wayland-push-to-talk-fix.git"
license=('MIT')
depends=('libevdev' 'xdotool')
makedepends=('git' 'gcc')
# The git repo is detected by the 'git:' or 'git+' beginning. The branch
# '$pkgname' is then checked out upon cloning, expediating versioning:
#source=('git+https://github.com/falconindy/expac.git'
source=("$pkgname"::'git+https://github.com/Rush/wayland-push-to-talk-fix.git')
# Because the sources are not static, skip Git checksum:
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm 755 push-to-talk $pkgdir/usr/bin/push-to-talk
  install -Dm 644 push-to-talk.desktop $pkgdir/etc/xdg/autostart/push-to-talk.desktop
}
