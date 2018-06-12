# Maintainer: Rafael Ascensão <rafa dot almas at gmail dot com>

_npmname='@google/clasp'
pkgname="nodejs-google-clasp"
pkgver=1.3.2
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
sha256sums=('5e4745538956d61d953a50df760117326eb0f129e1b63956b667b1b28e8a4146')

package() {
    cd $srcdir
    npm install -g --user root --prefix "$pkgdir"/usr "${_npmname##*/}-$pkgver.tgz"

    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/npm/issues/9359 for details.
    find "${pkgdir}"/usr -type d -exec chmod 755 {} +

    # Rename command because clasp from [community] has /usr/bin/clasp
    mv "${pkgdir}"/usr/bin/{,g}clasp
}
