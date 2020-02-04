# Maintainer: Sebastian Stammler <base64 -d<<<aWFtQGRlY2VudHIuYWwK>
# Co-Maintainer: Benjamin Schäfer <b-schaefer at posteo dot de>

_npmname=gitmoji-cli
pkgname=nodejs-${_npmname}
pkgver=3.2.1
pkgrel=1
pkgdesc='A gitmoji interactive client for using gitmojis on commit messages'
arch=('any')
url='https://gitmoji.carloscuesta.me/'
license=('MIT')
depends=('nodejs')
makedepends=('nodejs' 'npm')
optdepends=('noto-fonts-emoji: emojis'
            'ttf-symbola: emojis'
            'ttf-joypixels: emojis'
            'ttf-twemoji-color: emojis')
source=("https://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz")
md5sums=('8fbafdc73f8e161b0f37a2488fbd30e8')
sha512sums=('9cfb09f709a9cca854418e45889431e6c54b02bea4c832c8065c8b5866d98b9e880aa19aec288af6c7adb23d057c9ac1808ec7ebc7b99245e31fd90497e22491')
noextract=("${source[@]##*/}")

package() {
    npm install -g --prefix "${pkgdir}/usr" "${source[@]##*/}"
    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/npm/issues/9359 for details.
    find "${pkgdir}"/usr -type d -exec chmod 755 {} +
    # Remove references to $pkgdir in _where attributes
    find "${pkgdir}" -name package.json -print0 | xargs -0 sed -i -e '/_where/d'
}
