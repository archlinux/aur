# Maintainer: Jean-Francois Roy <jf at devklog dot net>

pkgname=helmfile-bin
pkgdesc="Helmfile is a declarative spec for deploying helm charts."
pkgver=0.164.0 # renovate: datasource=github-tags depName=helmfile/helmfile
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/helmfile/helmfile"
license=('MIT')
conflicts=('helmfile')
provides=('helmfile')

source_x86_64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v${pkgver}/helmfile_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v${pkgver}/helmfile_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=('6c2ef280f0d09ea0d9f3eb7d6eed68870d28f25fdf02021228690b3fe6ae6ff3')
sha256sums_aarch64=('d52902e198e5c3584beaed28f4b06680ac3ada674797973832ffb051776fdebb')

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
