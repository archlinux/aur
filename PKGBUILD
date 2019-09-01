# Maintainer: Julien Nicoulaud <julien dot nicoulaud at gmail dot com>

pkgname=sampler
pkgver=1.0.3
pkgrel=1
pkgdesc='A tool for shell commands execution, visualization and alerting. Configured with a simple YAML file.'
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url='https://sampler.dev'
license=('GPL3')
makedepends=('git' 'go-pie' 'alsa-lib')
conflicts=("${pkgname}-git")
source=("https://github.com/sqshq/sampler/archive/v${pkgver}.tar.gz")
sha256sums=('03aa155c04e02fa40097841515de4fbf57904142defe5433490e28792868842d')

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
}

