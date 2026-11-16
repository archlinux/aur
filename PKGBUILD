# Maintainer: RamazanBerk20 <119219364+RamazanBerk20 at users dot noreply dot github dot com>
pkgname=heaphook-bin
pkgver=1.0.0rc2
_tag=1.0.0-rc.2
pkgrel=1
pkgdesc="Memory scanner and debugger in the spirit of Cheat Engine (prebuilt)"
arch=('x86_64')
url="https://github.com/RamazanBerk20/HeapHook"
license=('Apache-2.0')
depends=('webkit2gtk-4.1' 'gtk3')
provides=('heaphook')
conflicts=('heaphook')
options=('!strip' '!debug')
source=("$url/releases/download/v$_tag/heaphook-$_tag-linux-x86_64.deb"
        "hh-server-$_tag::$url/releases/download/v$_tag/hh-server-$_tag-linux-x86_64"
        "LICENSE-$_tag::https://raw.githubusercontent.com/RamazanBerk20/HeapHook/v$_tag/LICENSE")
noextract=("heaphook-$_tag-linux-x86_64.deb")
sha256sums=('dbfa6219f63feec909f61dbdfb5944cd0d744bf6bd6ededdc7b2c7f4becc2a73'
            'bb0cf884c68b8718d5aa869de7c2ce013cfc933b6b91f423d62e72b233e90840'
            '074e6e32c86a4c0ef8b3ed25b721ca23aca83df277cd88106ef7177c354615ff')

package() {
  bsdtar -xOf "heaphook-$_tag-linux-x86_64.deb" 'data.tar*' | bsdtar -xf - -C "$pkgdir"
  # The deb names its launcher after the product; keep one predictable name.
  mv "$pkgdir/usr/share/applications/HeapHook.desktop" "$pkgdir/usr/share/applications/heaphook.desktop"
  install -Dm755 "hh-server-$_tag" "$pkgdir/usr/bin/hh-server"
  install -Dm644 "LICENSE-$_tag" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
