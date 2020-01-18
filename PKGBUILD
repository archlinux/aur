# Maintainer: Julien Nicoulaud <julien dot nicoulaud at gmail dot com>

pkgname=sampler
pkgver=1.1.0
pkgrel=1
pkgdesc='A tool for shell commands execution, visualization and alerting. Configured with a simple YAML file.'
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url='https://sampler.dev'
license=('GPL3')
makedepends=('git' 'go-pie' 'alsa-lib')
conflicts=("${pkgname}-git")
source=("https://github.com/sqshq/sampler/archive/v${pkgver}.tar.gz")
sha256sums=('8b60bc5c0f94ddd4291abc2b89c1792da424fa590733932871f7b5e07e7587f9')

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

