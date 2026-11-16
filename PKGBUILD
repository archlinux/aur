# Maintainer: RamazanBerk20 <119219364+RamazanBerk20 at users dot noreply dot github dot com>
pkgname=heaphook-bin
pkgver=1.0.0rc1
_tag=1.0.0-rc.1
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
sha256sums=('d44e98eae003ddf3bb6877fd70d59cc69b9dc471dd48b009b48ac89ce793753b'
            'aa62a5e3507d65450a4bde622af15b28bd67aee18c5bc130d70acc28ed43690b'
            '074e6e32c86a4c0ef8b3ed25b721ca23aca83df277cd88106ef7177c354615ff')

package() {
  bsdtar -xOf "heaphook-$_tag-linux-x86_64.deb" 'data.tar*' | bsdtar -xf - -C "$pkgdir"
  # The deb names its launcher after the product; keep one predictable name.
  mv "$pkgdir/usr/share/applications/HeapHook.desktop" "$pkgdir/usr/share/applications/heaphook.desktop"
  install -Dm755 "hh-server-$_tag" "$pkgdir/usr/bin/hh-server"
  install -Dm644 "LICENSE-$_tag" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
