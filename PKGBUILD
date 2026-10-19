# Maintainer: Denys Sedchenko <aur@x1unix.dev>
pkgname=codex-acp
_npmname=codex-acp
_npmscope=agentclientprotocol
pkgver=2.2.2
pkgrel=1
pkgdesc="ACP adapter for OpenAI Codex"
arch=('x86_64' 'aarch64')
url="https://github.com/agentclientprotocol/codex-acp"
license=('Apache-2.0')
depends=(
  'nodejs'
)
makedepends=('npm')
options=('!debug')
source=("https://registry.npmjs.org/@${_npmscope}/${_npmname}/-/${_npmname}-${pkgver}.tgz")
noextract=("${_npmname}-${pkgver}.tgz")
sha256sums=('5f4fa33c94959c928db11687376a050e9a5e7b72dba51963b571fa55ddb86168')

package() {
  npm install \
    --cache "${srcdir}/npm-cache" \
    --global \
    --prefix "${pkgdir}/usr" \
    "${srcdir}/${_npmname}-${pkgver}.tgz"

  # npm can create directories with non-deterministic permissions.
  find "${pkgdir}/usr" -type d -exec chmod 755 '{}' +

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s \
    "/usr/lib/node_modules/@${_npmscope}/${_npmname}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
