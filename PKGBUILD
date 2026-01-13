# Maintainer: Guru <anjanaya@gmail.com>
pkgname=mcp-cli-git
pkgver=0.1.4.r0.g7429637
pkgrel=1
pkgdesc="A lightweight CLI for interacting with MCP (Model Context Protocol) servers"
arch=('x86_64')
url="https://github.com/philschmid/mcp-cli"
license=('MIT')
provides=('mcp-cli')
conflicts=('mcp-cli' 'mcp-cli-bin')
makedepends=('git' 'bun')
source=("${pkgname}::git+https://github.com/philschmid/mcp-cli.git")
sha256sums=('SKIP')
options=('!strip')

pkgver() {
    cd "${pkgname}"
    git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${pkgname}"
    bun install --frozen-lockfile
    bun run build
}

package() {
    cd "${pkgname}"
    install -Dm755 "dist/mcp-cli" "${pkgdir}/usr/bin/mcp-cli"
}
