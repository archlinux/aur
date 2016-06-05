# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=algernon
pkgver=1.0
pkgrel=1
pkgdesc='HTTP/2 web server with built-in support for Markdown, Lua, Pongo2, JSX and Redis'
arch=('x86_64' 'i686')
url='http://algernon.roboticoverlords.org/'
license=('MIT')
makedepends=('go' 'git')
optdepends=('redis')
backup=('etc/algernon/serverconf.lua')
source=("git://github.com/xyproto/algernon#tag=$pkgver")
md5sums=('SKIP')
install='algernon.install'

prepare() {
  cd "$pkgname"

  GOPATH="$srcdir" go get -d
}

build() {
  cd "$pkgname"

  GOPATH="$srcdir" go build
}

package() {
  cd "$pkgname"

  install -Dm755 algernon "$pkgdir/usr/bin/algernon"
  install -Dm644 system/algernon.service "$pkgdir/usr/lib/systemd/system/algernon.service"
  install -Dm644 system/logrotate "$pkgdir/etc/logrotate.d/algernon"
  install -Dm644 system/serverconf.lua "$pkgdir/etc/algernon/server.lua"
  install -Dm644 desktop/algernon.desktop "$pkgdir/usr/share/desktop/algernon.desktop"
  install -Dm755 desktop/mdview "$pkgdir/usr/bin/mdview"
  install -Dm644 desktop/markdown.png "$pkgdir/usr/share/pixmaps/markdown.png"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
