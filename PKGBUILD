# Maintainer: Sebastian Stammler <base64 -d<<<aWFtQGRlY2VudHIuYWwK>
# Co-Maintainer: Benjamin Schäfer <b-schaefer at posteo dot de>

_npmname=gitmoji-cli
pkgname=nodejs-${_npmname}
pkgver=3.2.2
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
md5sums=('c442fdd5fb09fd4225c241ef397ab4bf')
sha512sums=('1de4512c0dee44dc24a16531fdacc22ea0c95d1cda2b7d9d635e4a58e296a060671f9988dc05edf7f887e10057c80e9e9120d0734b217baf744a999386a35e78')
noextract=("${source[@]##*/}")

package() {
    npm install -g --prefix "${pkgdir}/usr" "${source[@]##*/}"
    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/npm/issues/9359 for details.
    find "${pkgdir}"/usr -type d -exec chmod 755 {} +
    # Remove references to $pkgdir in _where attributes
    find "${pkgdir}" -name package.json -print0 | xargs -0 sed -i -e '/_where/d'
}
