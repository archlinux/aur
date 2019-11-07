# Contributor: David Birks <david@tellus.space>
# Contributor: Simon Doppler (dopsi) <dop.simon@gmail.com>
# Contributor: dpeukert
# Contributor: Gabriel Saillard (GitSquared) <gabriel@saillard.dev>

pkgname=marktext
pkgver=0.15.1
pkgrel=3
pkgdesc='A simple and elegant open-source markdown editor that focused on speed and usability'
arch=('x86_64')
url='https://github.com/marktext/marktext'
license=('MIT')
provides=('marktext')
conflicts=('marktext-bin' 'marktext-git')
depends=('libxkbfile')
makedepends=('nodejs' 'npm' 'python2' 'tar')
source=("http://github.com/marktext/marktext/archive/v${pkgver}.tar.gz")
sha512sums=('d78954493c0035f6d7b85b84798bf1bb6093fc276f2b9d50e1cf78d32dbc72a0629f33c6d56985d6ddb8b26b89cfb46077e03a929f63f12a1cde4eb807bc02c0')
install='marktext.install'

prepare() {
    cd "${pkgname}-${pkgver}"
    npx yarn install
}

build() {
    cd "${pkgname}-${pkgver}"
    node .electron-vue/build.js && ./node_modules/.bin/electron-builder build --dir --linux pacman
}

package() {
    tar xf ${pkgname}-${pkgver}/build/marktext-*.pacman -C "${pkgdir}"

    rm -f "${pkgdir}/.INSTALL" "${pkgdir}/.MTREE" "${pkgdir}/.PKGINFO"

    chmod 755 "${pkgdir}/opt/Mark Text/marktext"
}
