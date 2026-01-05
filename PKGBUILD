# Maintainer: Jean-Francois Roy <jf at devklog dot net>

pkgname=helmfile-bin
pkgdesc="Helmfile is a declarative spec for deploying helm charts."
pkgver=1.2.3 # renovate: datasource=github-tags depName=helmfile/helmfile
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/helmfile/helmfile"
license=('MIT')
conflicts=('helmfile')
provides=('helmfile')

source_x86_64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v${pkgver}/helmfile_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v${pkgver}/helmfile_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=('e238185ff094ecf41d81f2938711569803698355c7fc6081fa047bfa27b4c55c')
sha256sums_aarch64=('16baf067534d4176b75cac3f3b791f5954ecba8f353ba7d7cbe0c1dd7396f819')

noextract=("$pkgname-$pkgver.tar.gz")

prepare() {
  mkdir -p "$pkgname-$pkgver"
  tar -xf "$pkgname-$pkgver.tar.gz" -C "$pkgname-$pkgver"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 helmfile "${pkgdir}/usr/bin/helmfile"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
