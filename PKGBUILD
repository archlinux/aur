# Maintainer: Tim Falken <tim@timfalken.com>
# De CI (scripts/ci/publish-aur.sh) zet pkgver, _tag en sha256sums.
pkgname=legacycycles-server-bin
pkgver=0.0.37
pkgrel=1
_tag=v0.0.37
pkgdesc='Dedicated server for Legacy Cycles (prebuilt binary, systemd service)'
arch=('x86_64')
url='https://git.timfalken.com/timfa/legacy-cycles'
license=('MIT')
depends=('gcc-libs' 'glibc')
provides=('legacy-cycles-server' 'legacy-cycles-server-bin')
# Het bronpakket legacy-cycles levert /usr/bin/legacy-cycles-server ook.
# Tot v0.0.31 heette dit AUR-pakket legacy-cycles-server-bin (zie de client-PKGBUILD).
conflicts=('legacy-cycles-server' 'legacy-cycles' 'legacy-cycles-server-bin')
replaces=('legacy-cycles-server-bin')
backup=('etc/legacy-cycles-server/server.env')
install=legacy-cycles-server.install
options=('!strip' '!debug')
_local=('legacy-cycles-server.service' 'legacy-cycles-server.sysusers' 'legacy-cycles-server.tmpfiles' 'server.env')
source=("legacy-cycles-server-${_tag}-linux-x86_64.tar.gz::${url}/-/releases/${_tag}/assets/legacy-cycles-server-${_tag}-linux-x86_64.tar.gz"
        "${_local[@]}")
sha256sums=('0eba4044a6fd9834d748df3f3e52040008ad6db20be0ead1301b606160112f26' '614fb8a166e834ef1e1f4645d8771055b0e47667d2be5d6d9d3363447b254baa' '7d5232180ae287d94d7a4dcc83528b8d7ff4fb7c84bd914cfa1cd79a963afe1e' '7f6f3490bf4145f05df4f9d5a32adc80cef97addfab62a71926d7401e138d450' '7dcb112a9742e69cb89f4daa459e56d73f32e0b344079ee1e3f7c23f9e594549')

package() {
  install -Dm755 "$srcdir/legacy-cycles-server-${_tag}-linux-x86_64/legacy-cycles-server" "$pkgdir/usr/bin/legacy-cycles-server"
  install -Dm644 "$srcdir/legacy-cycles-server-${_tag}-linux-x86_64/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/legacy-cycles-server.service" "$pkgdir/usr/lib/systemd/system/legacy-cycles-server.service"
  install -Dm644 "$srcdir/legacy-cycles-server.sysusers" "$pkgdir/usr/lib/sysusers.d/legacy-cycles-server.conf"
  install -Dm644 "$srcdir/legacy-cycles-server.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/legacy-cycles-server.conf"
  install -Dm644 "$srcdir/server.env" "$pkgdir/etc/legacy-cycles-server/server.env"
}
