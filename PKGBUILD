# Maintainer: Guru <anjanaya@gmail.com>
pkgname=agent-browser
pkgver=0.8.5
pkgrel=2
pkgdesc="Headless browser automation CLI for AI agents"
arch=('any')
url="https://github.com/vercel-labs/agent-browser"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('0f954f68d31771a4f1f040ec6a4917b1f1739d23f6f3ce1e802a7ebcb9b14cd4')

package() {
    # Ensure system node/npm are used, bypassing version managers like asdf
    export PATH="/usr/bin:$PATH"

    npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

    # Clean npm metadata from node_modules
    find "${pkgdir}/usr/lib/node_modules" -name 'package.json' -exec \
        sed -i '/_where/d; /_resolved/d; /_integrity/d; /_from/d' {} \;

}
