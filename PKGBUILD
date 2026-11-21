# Maintainer: Raul Dias <raul@dias.com.br>

pkgname=msi-gpu-mux-switch-bin
_pkgname=msi-gpu-mux-switch
pkgver=0.2.0
pkgrel=1
pkgdesc='Inspect and switch the GPU MUX mode on the MSI Vector 16 HX AI A2XWIG (prebuilt upstream release)'
arch=(x86_64)
url='https://github.com/steelbrain/msi-gpu-mux-switch'
license=(MIT)
depends=(libgcc glibc)
provides=("$_pkgname")
conflicts=("$_pkgname")
options=(!strip !debug)
# The zip is upstream's official build; its checksum is the one published in
# the release's SHA256SUMS. LICENSE and README come from the tagged source.
source=("$_pkgname-$pkgver-linux-amd64.zip::$url/releases/download/v$pkgver/linux-amd64-msi-mux-switch.zip"
        "$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
noextract=("$_pkgname-$pkgver-linux-amd64.zip")
sha256sums=('8b7f7421571602697400da8007415721192576bf8ccd4fc72cb0ac6fd34c744f'
            '005d6155b36fea66c0c07304438c28df04f3aacfa00db06507a93cb27d65f5ef')

prepare() {
  mkdir -p bin
  bsdtar -xf "$_pkgname-$pkgver-linux-amd64.zip" -C bin msi-mux-switch
}

package() {
  install -Dm755 bin/msi-mux-switch -t "$pkgdir/usr/bin"
  cd "$_pkgname-$pkgver"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
