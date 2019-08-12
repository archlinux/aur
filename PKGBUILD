# Maintainer: Julien Nicoulaud <julien dot nicoulaud at gmail dot com>

pkgname=sampler
pkgver=1.0.2
pkgrel=1
pkgdesc='A tool for shell commands execution, visualization and alerting. Configured with a simple YAML file.'
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url='https://sampler.dev'
license=('custom:Fair Source License')
makedepends=('git' 'go-pie' 'alsa-lib')
conflicts=("${pkgname}-git")
source=("https://github.com/sqshq/sampler/archive/v${pkgver}.tar.gz")
sha256sums=('3b5240322ed0f48529af94cecee55900ae05ab776531a2e75337bf99fe8b1ff2')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  GOFLAGS="-gcflags=all=-trimpath=${PWD} -asmflags=all=-trimpath=${PWD} -ldflags=-extldflags=-zrelro -ldflags=-extldflags=-znow" go build
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  go test -v ./...
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}

