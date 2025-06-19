# Maintainer: Jean-Francois Roy <jf at devklog dot net>

pkgname=helmfile-bin
pkgdesc="Helmfile is a declarative spec for deploying helm charts."
pkgver=1.1.2 # renovate: datasource=github-tags depName=helmfile/helmfile
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/helmfile/helmfile"
license=('MIT')
conflicts=('helmfile')
provides=('helmfile')

source_x86_64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v${pkgver}/helmfile_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v${pkgver}/helmfile_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=('172bcc08a7ba48e6f7c2ac496b407ee56a99f4431b84a58f9d484dcf58862566')
sha256sums_aarch64=('9a7ef45f38c24c4a3e56973da1bd7e13d3d106fb6f15624910be754f4d74c980')

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
