#!/usr/bin/env bash
# shellcheck disable=SC2034,SC2154
# Maintainer: Julian Lobbes <julian (at) lobbes (dot) dev>

pkgname='gobatmon'
pkgver='0.4.0'
pkgrel='1'
pkgdesc='Simple battery level monitor for Linux written in Go.'
arch=('x86_64')
url="https://github.com/ulinja/${pkgname}"
license=('WTFPL')
makedepends=('go')
provides=("${pkgname}")
conflicts=("${pkgname}")
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('39313bcc249c5e70f104f6e660dd8e089cf86bec80890e3ad60fe1154797175a')

build ()
{
    cd "${pkgname}-${pkgver}" || exit
    export CGO_ENABLED=0
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'
    go build
}

check ()
{
    cd "${pkgname}-${pkgver}" || exit
    ./"${pkgname}" "--version"
}

package ()
{
    cd "${pkgname}-${pkgver}" || exit
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
