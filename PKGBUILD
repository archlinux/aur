_npmname='reveal-md'
pkgname='nodejs-reveal-md'
pkgver=5.3.2
pkgrel=1
pkgdesc='Get beautiful reveal.js presentations from your Markdown file'
arch=('any')
url='http://webpro.github.io/reveal-md/'
license=('MIT')
depends=('nodejs')
conflicts=('reveal-md')
makedepends=('npm')
source=("http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=('$_npmname-$pkgver.tgz')
sha256sums=('fe3ae8782dd3eb3355666b62ae8ecea534745ba3133bbf5700fe38c101f64ed1')

package() {
    npm i --cache "${srcdir}/npm-cache" --omit=dev --omit=optional --global --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"

    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/cli/issues/1103 for details.
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"
}

# vim:set ts=2 sw=2 et:
