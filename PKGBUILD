# Maintainer: Guru <anjanaya@gmail.com>
pkgname=agent-browser
pkgver=0.9.1
pkgrel=1
pkgdesc="Headless browser automation CLI for AI agents"
arch=('any')
url="https://github.com/vercel-labs/agent-browser"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('53356c6ecb7cd5d253b828def43c1727d2f60a6f022c81b93ba29646fa20bc7b')

package() {
    # Ensure system node/npm are used, bypassing version managers like asdf
    export PATH="/usr/bin:$PATH"

    npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

    # Clean npm metadata from node_modules
    find "${pkgdir}/usr/lib/node_modules" -name 'package.json' -exec \
        sed -i '/_where/d; /_resolved/d; /_integrity/d; /_from/d' {} \;

}
