# Maintainer: ValdikSS <iam@valdikss.org.ru>

pkgname=imgur-screenshot-git
_pkgname=imgur-screenshot
pkgver=1.7.2.r0.gdc8eaa6
pkgrel=1
pkgdesc="Take screenshot selection, upload to imgur + more cool things"
arch=('any')
url="https://github.com/jomo/imgur-screenshot"
license=('MIT')
depends=('curl' 'grep')
optdepends=('libnotify: for desktop notifications'
            'scrot: for making screenshots'
            'xclip: for copying screenshot URLs to clipboard')
install='imgur-screenshot.install'
source=('git+https://github.com/jomo/imgur-screenshot.git'
        'imgur-screenshot.desktop'
        'imgur-screenshot.png')
md5sums=('SKIP'
         '459431a977061e56894315ce151d9bef'
         '3780c9f2183f7d4705ab86ab077e3885')

pkgver() {
  cd "$_pkgname"
  #printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname"

  sed -i 's~$HOME/Pictures/imgur.png~/usr/share/pixmaps/imgur-screenshot.png~' imgur-screenshot.sh
}

package() {
  cd "$srcdir/$_pkgname"

  install -Dm644  ".version.txt" "$pkgdir/usr/share/imgur-screenshot/.version.txt"
  install -Dm644 "$srcdir/imgur-screenshot.png" "$pkgdir/usr/share/pixmaps/imgur-screenshot.png"
  install -Dm644 "$srcdir/imgur-screenshot.desktop" "$pkgdir/usr/share/applications/imgur-screenshot.desktop"
  install -Dm755 imgur-screenshot.sh "$pkgdir/usr/bin/imgur-screenshot"
}
