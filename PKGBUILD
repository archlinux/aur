# Maintainer: Sebastian Stammler <base64 -d<<<aWFtQGRlY2VudHIuYWwK>

_npmname=gitmoji-cli
pkgname=nodejs-${_npmname}
pkgver=1.9.2
pkgrel=1
pkgdesc='A gitmoji interactive client for using gitmojis on commit messages'
arch=('any')
url='https://gitmoji.carloscuesta.me/'
license=('MIT')
depends=('nodejs')
makedepends=('nodejs' 'npm')
source=("https://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz")
md5sums=('190d73c7aacec45cf137ee39c5600f3f')
sha512sums=('89019abfeeb3d98aca6168f616dc1e23f688570103227b6ce76cde8e5b4921c388a2fc97af2105b58961e1dfccf8489934788021fe67c0a875e731ce663f6749')
noextract=("${source[@]##*/}")

package() {
    npm install -g --prefix "${pkgdir}/usr" "${source[@]##*/}"
    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/npm/issues/9359 for details.
    find "${pkgdir}"/usr -type d -exec chmod 755 {} +
    # Remove references to $pkgdir in _where attributes
    find "${pkgdir}" -name package.json -print0 | xargs -0 sed -i -e '/_where/d'
}
