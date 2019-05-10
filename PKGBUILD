# Maintainer: Julien Nicoulaud <julien dot nicoulaud at gmail dot com>

pkgname=gotify-cli
pkgver=2.1.1
pkgrel=1
pkgdesc='A command line interface for pushing messages to gotify/server.'
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url='https://github.com/gotify/cli'
license=('MIT')
makedepends=('go-pie' 'make' 'git')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("https://github.com/gotify/cli/archive/v${pkgver}.tar.gz")
sha256sums=('b2cb3ff9164a73ded51452c054703825b429e7c83753414f6a438ca1ac449f53')

build() {
  cd "${srcdir}/cli-${pkgver}"
  export GOFLAGS="-gcflags=all=-trimpath=${PWD} -asmflags=all=-trimpath=${PWD} -ldflags=-extldflags=-zrelro -ldflags=-extldflags=-znow -ldflags=-X=main.Version=${pkgver}"
  go build -o build/gotify cli.go
}

package() {
  cd "${srcdir}/cli-${pkgver}"
  install -D -m755 build/gotify "${pkgdir}/usr/bin/gotify"
}

