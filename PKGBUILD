# Maintainer: Jean-Francois Roy <jf at devklog dot net>

pkgname=helmfile-bin
pkgdesc="Helmfile is a declarative spec for deploying helm charts."
pkgver=1.1.7 # renovate: datasource=github-tags depName=helmfile/helmfile
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/helmfile/helmfile"
license=('MIT')
conflicts=('helmfile')
provides=('helmfile')

source_x86_64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v${pkgver}/helmfile_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v${pkgver}/helmfile_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=('e9d870f4e502b9f0850d7e0546cab8b418ff7f44ff4df0ed54cd3df8dfda189c')
sha256sums_aarch64=('e9d870f4e502b9f0850d7e0546cab8b418ff7f44ff4df0ed54cd3df8dfda189c')

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
