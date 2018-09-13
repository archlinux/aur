# Maintainer: Sebastian Stammler <base64 -d<<<aWFtQGRlY2VudHIuYWwK>

_npmname=gitmoji-cli
pkgname=nodejs-${_npmname}
pkgver=1.9.1
pkgrel=1
pkgdesc='A gitmoji interactive client for using gitmojis on commit messages'
arch=('any')
url='https://gitmoji.carloscuesta.me/'
license=('MIT')
depends=('nodejs')
makedepends=('nodejs' 'npm')
source=("https://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz")
md5sums=('5368baa00c859abb348bf7bb2a02cbb4')
sha512sums=('58a21692c6edd80650af52b1b94d3882ea3e5adead6dcafa383b4054798571434a410fa1358caa2f9ba3beb77e3da6867b89602c14e7686bc27aea6bbd1dceed')
noextract=("${source[@]##*/}")

package() {
    npm install -g --prefix "${pkgdir}/usr" "${source[@]##*/}"
    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/npm/issues/9359 for details.
    find "${pkgdir}"/usr -type d -exec chmod 755 {} +
    # Remove references to $pkgdir in _where attributes
    find "${pkgdir}" -name package.json -print0 | xargs -0 sed -i -e '/_where/d'
}
