# Maintainer: Raul Dias <raul@dias.com.br>

pkgname=msi-gpu-mux-switch-bin
_pkgname=msi-gpu-mux-switch
pkgver=0.3.0
pkgrel=1
pkgdesc='Inspect and switch the GPU MUX mode on supported MSI laptops (prebuilt upstream release)'
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
sha256sums=('1dd61f8f44e376717e261b81a99cafb3f59b8cf7f0d1630e72f785b4107d5f46'
            '952a56d6d1027ef6b14d13c790b9cc3f0ce38527a8da4a83778b1d3860e6994d')

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
