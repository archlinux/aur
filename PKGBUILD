# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=algernon
pkgver=1.11.0
pkgrel=2
pkgdesc='Single executable web server with Lua, Markdown, QUIC and Pongo2 support'
arch=('x86_64')
url='https://algernon.roboticoverlords.org/'
license=('MIT')
depends=('redis')
makedepends=('git' 'go-pie')
optdepends=('mariadb: For using the MariaDB/MySQL database backend'
            'postgresql: For using the PostgreSQL database backend')
backup=('etc/algernon/serverconf.lua'
        'usr/lib/systemd/system/algernon.service')
source=("git+https://github.com/xyproto/algernon#commit=b23b6d52e0eb32581d00483e0f439d7c305434b2")
md5sums=('SKIP')

prepare() {
  cd "$pkgname"

  GO111MODULE=off go build
}

package() {
  cd "$pkgname"

  install -Dm755 algernon "$pkgdir/usr/bin/algernon"
  install -Dm755 desktop/mdview "$pkgdir/usr/bin/mdview"
  install -Dm644 system/algernon_dev.service "$pkgdir/usr/lib/systemd/system/algernon.service"
  install -Dm644 system/logrotate "$pkgdir/etc/logrotate.d/algernon"
  install -Dm644 system/serverconf.lua "$pkgdir/etc/algernon/serverconf.lua"
  install -Dm644 desktop/algernon.desktop "$pkgdir/usr/share/applications/algernon.desktop"
  install -Dm644 desktop/algernon_md.desktop "$pkgdir/usr/share/applications/algernon_md.desktop"
  install -Dm644 desktop/markdown.png "$pkgdir/usr/share/pixmaps/markdown.png"
  install -d "$pkgdir/usr/share/doc/$pkgname/"
  cp -r samples "$pkgdir/usr/share/doc/algernon/samples"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
