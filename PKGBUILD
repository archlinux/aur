_npmname='reveal-md'
pkgname='nodejs-reveal-md'
pkgver=5.5.2
pkgrel=1
pkgdesc='Get beautiful reveal.js presentations from your Markdown file'
arch=('any')
url='https://github.com/webpro/reveal-md'
license=('MIT')
depends=('nodejs')
conflicts=('reveal-md')
makedepends=('npm')
source=("http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=('$_npmname-$pkgver.tgz')
sha256sums=('d3fbca53d4e3c330bd458ed0b696b3725f16f002b12c4a7fceed7380d651afd7')

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
