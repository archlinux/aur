# Maintainer: Jean-Francois Roy <jf at devklog dot net>

pkgname=helmfile-bin
pkgdesc="Helmfile is a declarative spec for deploying helm charts."
pkgver=1.5.2 # renovate: datasource=github-tags depName=helmfile/helmfile
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/helmfile/helmfile"
license=('MIT')
conflicts=('helmfile')
provides=('helmfile')

source_x86_64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v${pkgver}/helmfile_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v${pkgver}/helmfile_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=('96e342ff19a45c2e36371f93cf6264f3ef285bbde0fc363e56cb53bdef3df1ff')
sha256sums_aarch64=('4488ca172141a2ad563ac99fffdd8f4761620b40e8e7878ab3fd0e436d4ec057')

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
