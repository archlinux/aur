#!/usr/bin/env bash
# shellcheck disable=SC2034
# Maintainer: Duncan <duncan@mac-vicar.eu>
# Co-Maintainer: Chmouel Boudjnah <chmouel@chmouel.com>
org=zed-industries
realname=claude-agent-acp
pkgname=$realname
pkgver=0.20.2
pkgrel=1
pkgdesc="Use Claude Agent from any ACP client such as Zed!"
arch=('x86_64')
url="https://github.com/$org/$realname"
license=('Apache-2.0')
makedepends=('npm')
depends=('nodejs')
conflicts=('claude-code-acp')
provides=('claude-code-acp')
source=("$realname-$pkgver.tar.gz::https://github.com/$org/$realname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9c180e871b9b34fc519335c3dc2d1eff06bbf2d61d6f2b70631881a1f98ddea9')
options=(!strip !debug)

build() {
  cd "$srcdir/$realname-$pkgver"
  npm ci
  npm run build
}

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${realname}-${pkgver}"
  ln -s claude-agent-acp "${pkgdir}/usr/bin/claude-code-acp"
}
