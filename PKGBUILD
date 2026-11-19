# Maintainer: Marcel W. Wysocki <maci.stgn@gmail.com>
pkgname=paseo-bun-bin
pkgver=0.16.2
pkgrel=1
pkgdesc='Paseo native Bun AOT desktop and daemon with Elysia, Tauri v2 and UI performance patches (release binaries)'
arch=('x86_64')
url='https://github.com/maci0/paseo-bun'
license=('Apache-2.0')
depends=('glibc>=2.39' 'gcc-libs' 'gtk3' 'webkit2gtk-4.1' 'openssl' 'zlib' 'git')
optdepends=('openssh: SSH connections and Git remotes')
provides=("paseo-bun=$pkgver")
conflicts=('paseo-bun')
options=('!strip' '!debug')
_upstreamver=0.16.2
_release=bun-aot-v0.16.2
source=("paseo-bun-desktop-${_upstreamver}-linux-x64-aot.tar.gz::${url}/releases/download/${_release}/paseo-bun-desktop-${_upstreamver}-linux-x64-aot.tar.gz")
sha256sums=('42a5eeabce7bae73085481639b6bc45955b2345700e6d0a9d8745efaf8332d64')

check() {
  [[ $("$srcdir/paseo-bun/paseo-bun" --version) == "$_upstreamver" ]]
  [[ $("$srcdir/paseo-bun/paseo-bun-desktop" --version) == "Paseo Bun Desktop $_upstreamver" ]]
}

package() {
  local _bundle="$srcdir/paseo-bun"
  install -dm755 "$pkgdir/usr/lib/paseo-bun" "$pkgdir/usr/bin"
  cp -a "$_bundle/." "$pkgdir/usr/lib/paseo-bun/"
  ln -s ../lib/paseo-bun/paseo-bun "$pkgdir/usr/bin/paseo-bun"
  ln -s ../lib/paseo-bun/paseo-bun-desktop "$pkgdir/usr/bin/paseo-bun-desktop"
  install -Dm644 "$_bundle/share/applications/sh.paseo.bun.desktop" "$pkgdir/usr/share/applications/sh.paseo.bun.desktop"
  install -Dm644 "$_bundle/share/icons/hicolor/256x256/apps/sh.paseo.bun.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/sh.paseo.bun.png"
  install -Dm644 "$_bundle/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
