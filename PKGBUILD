# Maintainer: Colin Adler <colin@coder.com>
# Maintainer: Anmol Sethi <anmol@coder.com>

pkgname=code-server
pkgver=3.3.1
pkgrel=3
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
sha512sums_x86_64=('1589d6c5ebac18d0a46e2a22b6d6070b64f80fd2a3c407acd10f5c8f26adae9b17bc9fd977711cbdbc5c67f0753d2c621d8cddd03509e867b4fa532352f85308')
sha512sums_aarch64=('87b6a7a11cee5f74fba5e8b66686732c2d49bd9f7582d7716642e1fbb253c137d9995b7e56591f53e010eb8abc447bd0014b25dfb07e96f0ca97064787d46003')

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
