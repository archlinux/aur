# Maintainer: Sebastian Stammler <base64 -d<<<aWFtQGRlY2VudHIuYWwK>
# Co-Maintainer: Benjamin Schäfer <b-schaefer at posteo dot de>

_npmname=gitmoji-cli
pkgname=nodejs-${_npmname}
pkgver=3.0.1
pkgrel=1
pkgdesc='A gitmoji interactive client for using gitmojis on commit messages'
arch=('any')
url='https://gitmoji.carloscuesta.me/'
license=('MIT')
depends=('nodejs')
makedepends=('nodejs' 'npm')
source=("https://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz")
md5sums=('ab8ff540536d5d68a960947078d2aa05')
sha512sums=('80d1e13f470e2f7f33c78ce7d394982532dd9d0074986bb4f7323798860dfb0b85c9b4b0d48ec6a54bebf7361e30ec051e231a729789f25941bcdcb02d99cced')
noextract=("${source[@]##*/}")

package() {
    npm install -g --prefix "${pkgdir}/usr" "${source[@]##*/}"
    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/npm/issues/9359 for details.
    find "${pkgdir}"/usr -type d -exec chmod 755 {} +
    # Remove references to $pkgdir in _where attributes
    find "${pkgdir}" -name package.json -print0 | xargs -0 sed -i -e '/_where/d'
}
