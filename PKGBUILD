#!/usr/bin/env bash
# shellcheck disable=SC2034
# Maintainer: Duncan <duncan@mac-vicar.eu>
# Co-Maintainer: Chmouel Boudjnah <chmouel@chmouel.com>
org=agentclientprotocol
realname=claude-agent-acp
pkgname=$realname
pkgver=0.45.1
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
sha256sums=('59d832c32a0c80eed0bdfc2337c7ff0b894a6832d00ece6c4ae709ee28f3cf59')
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
