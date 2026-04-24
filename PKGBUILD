#!/usr/bin/env bash
# shellcheck disable=SC2034
# Maintainer: Duncan <duncan@mac-vicar.eu>
# Co-Maintainer: Chmouel Boudjnah <chmouel@chmouel.com>
org=agentclientprotocol
realname=claude-agent-acp
pkgname=$realname
pkgver=0.31.0
pkgrel=3
pkgdesc="Use Claude Agent from any ACP client such as Zed!"
arch=('x86_64')
url="https://github.com/$org/$realname"
license=('Apache-2.0')
makedepends=('npm')
depends=('nodejs')
conflicts=('claude-code-acp')
provides=('claude-code-acp')
source=("$realname-$pkgver.tar.gz::https://github.com/$org/$realname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6419108c7df67b22f4ab9b28dab18cf40f4701d5c4896d24f27a8cff7fe0bc52')
options=(!strip !debug)

build() {
  cd "$srcdir/$realname-$pkgver" || exit
  npm ci
  npm run build
  npm pack
}

package() {
  npm install -g --prefix "${pkgdir}/usr" \
    "${srcdir}/${realname}-${pkgver}/${org}-${realname}-${pkgver}.tgz"
  ln -s claude-agent-acp "${pkgdir}/usr/bin/claude-code-acp"
}
