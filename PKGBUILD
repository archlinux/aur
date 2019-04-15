# Maintainer: Julien Nicoulaud <julien dot nicoulaud at gmail dot com>

pkgname=gotify-cli
pkgver=2.0.0
pkgrel=1
pkgdesc='A command line interface for pushing messages to gotify/server.'
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url='https://github.com/gotify/cli'
license=('MIT')
makedepends=('go-pie' 'make' 'git')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("https://github.com/gotify/cli/archive/v${pkgver}.tar.gz")
sha256sums=('6f021cfe7fa07d12edbf1056817d3cec4ceb23946c9c3f2cc3eeece14c08a006')

build() {
  cd "${srcdir}/cli-${pkgver}"
  export GOFLAGS="-gcflags=all=-trimpath=${PWD} -asmflags=all=-trimpath=${PWD} -ldflags=-extldflags=-zrelro -ldflags=-extldflags=-znow -ldflags=-X=main.Version=${pkgver}"
  go build -o build/gotify cli.go
}

package() {
  cd "${srcdir}/cli-${pkgver}"
  install -D -m755 build/gotify "${pkgdir}/usr/bin/gotify"
}

