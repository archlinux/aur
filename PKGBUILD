# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: Justin Dray <justin@dray.be>
# Contributor: Florent Peterschmitt

_npmname=jsonlint
pkgname=nodejs-"$_npmname"
pkgver=1.6.3
pkgrel=4
pkgdesc='Validate JSON'
arch=('any')
url="https://zaa.ch/$_npmname}/"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
sha256sums=('987f42f0754b7bc0c84967b81fc2b4db0ed2ebe2117ccc5a5faa59e462447723')
noextract=("${source[@]##*/}")

package() {
    npm install -g --user root --cache "${srcdir}/npm-cache" --prefix "$pkgdir/usr" "${source[@]##*/}"
    find "${pkgdir}"/usr -type d -exec chmod 755 {} +
    find "${pkgdir}" -type f -name package.json -exec sed -i -e "/${pkgdir//\//\\/}/d" -e "/${srcdir//\//\\/}/d" {} \;
    chown -R root:root $pkgdir
}
