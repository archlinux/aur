# Maintainer: Colin Adler <colin@coder.com>
# Maintainer: Anmol Sethi <anmol@coder.com>

pkgname=code-server
pkgver=3.4.0
pkgrel=1
pkgdesc="VS Code in the browser"
arch=("x86_64" "aarch64")
url="https://github.com/cdr/code-server"
license=(MIT)
depends=(glibc)
source=(
  "$pkgname-$pkgver.service::https://raw.githubusercontent.com/cdr/code-server/v$pkgver/ci/build/code-server.service"
)
release_name="code-server-${pkgver}-linux"
source_x86_64=(
  "${url}/releases/download/v$pkgver/$release_name-amd64.tar.gz"
)
source_aarch64=(
  "${url}/releases/download/v$pkgver/$release_name-arm64.tar.gz"
)
sha512sums=('7040df09c7404a56dbbb32e09d04ead3b622773520feae19c6710656cef46ca5d79b1972bfebb931e309e495d041b9938cd6a51c39fc0f8f6133dfe711be9280')
sha512sums_x86_64=('e62779861d598c0a88916f31134161924f59e3fe9812688f1591280543c22533cb75c253e102245e7fb6e1cf00032e34f5ba3418b946d8370e2ab040bf87c5ff')
sha512sums_aarch64=('3eaa6f7b0506d8a81cd6337bcd5487628e01d6967c33468529bb1a7164fb3276f2b19afbb1b70fcc93e25deafd675fff3b8a9e2c0856173da36aa009178e06df')

package() {
  if [[ $(uname -m) == x86_64 ]]; then
    release_name+=-amd64
  else
    release_name+=-arm64
  fi

  mkdir -p "$pkgdir/usr/lib"
  cp -a "$release_name" "$pkgdir/usr/lib/$pkgname"

  mkdir -p "$pkgdir/usr/bin"
  ln -s "/usr/lib/$pkgname/bin/$pkgname" "$pkgdir/usr/bin/$pkgname"

  mkdir -p "$pkgdir/usr/lib/systemd/user"
  cp -a "$pkgname-$pkgver.service" "$pkgdir/usr/lib/systemd/user/$pkgname.service"

  mkdir -p "$pkgdir/usr/share/licenses"
  cp -a "$release_name/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname"
}
