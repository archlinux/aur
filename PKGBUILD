# Maintainer: ewgsta <your-email@example.com>

pkgname=weeb-cli
pkgver=1.0.0
pkgrel=1
pkgdesc="Tarayıcı yok, reklam yok, dikkat dağıtıcı unsur yok. Sadece sen ve anime."
arch=('any')
url="https://github.com/ewgsta/weeb-cli"
license=('CC-BY-NC-ND-4.0')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('ab60415a6cda120fc87179fe62d7d182c154d8223b3f2a2b258f5aee4b7d97c7') # Update this with `sha256sum weeb-cli-1.0.0.tgz` after first npm publish

package() {
    npm install -g --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"

    # Fix permissions
    find "$pkgdir/usr" -type d -exec chmod 755 {} +
    
    # Remove references to pkgdir
    find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

    # Handle license if needed
    # install -Dm644 "$pkgdir/usr/lib/node_modules/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
