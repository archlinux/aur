# Maintainer: Guru <anjanaya@gmail.com>
pkgname=playwright-cli
pkgver=0.1.11
pkgrel=1
pkgdesc="CLI for browser automation - record, generate code, inspect selectors, take screenshots"
arch=('any')
url="https://playwright.dev/"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/@playwright/cli/-/cli-${pkgver}.tgz")
sha256sums=('7d7b3cce1e42affaba7e168699e5aa19d87801a4f336497c70fd230f507baee9')
noextract=("cli-${pkgver}.tgz")

package() {
    # Ensure system node/npm are used, bypassing version managers like asdf
    export PATH="/usr/bin:$PATH"

    npm install -g --prefix "${pkgdir}/usr" "${srcdir}/cli-${pkgver}.tgz"

    # Fix permissions
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +

    # Remove package.json references to $pkgdir
    find "${pkgdir}" -name package.json -exec sed -i "s|${pkgdir}||g" {} +
}
