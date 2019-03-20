# Maintainer: Rafael Ascensão <rafa dot almas at gmail dot com>

_npmname='@google/clasp'
pkgname="nodejs-google-clasp"
pkgver=2.1.0
pkgrel=1
pkgdesc='Develop Apps Script Projects locally'
arch=('any')
url='https://github.com/google/clasp'
license=('Apache')
depends=('nodejs')
makedepends=('npm')
optdepends=('typescript: autocompletion and linting')
source=("https://registry.npmjs.org/$_npmname/-/${_npmname##*/}-$pkgver.tgz")
noextract=("${_npmname##*/}-$pkgver.tgz")
sha256sums=('da6a2be9f7c99f14c1689f67c5019728717baa749f73e133b07cc9a9b644017f')

package() {
    cd $srcdir
    npm install -g --user root --prefix "$pkgdir"/usr "${_npmname##*/}-$pkgver.tgz"

    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/npm/issues/9359 for details.
    find "${pkgdir}"/usr -type d -exec chmod 755 {} +

    # Rename command because clasp from [community] has /usr/bin/clasp
    mv "${pkgdir}"/usr/bin/{,g}clasp
}
