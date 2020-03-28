# Contributor: David Birks <david@tellus.space>
# Contributor: Simon Doppler (dopsi) <dop.simon@gmail.com>
# Contributor: dpeukert
# Contributor: Gabriel Saillard (GitSquared) <gabriel@saillard.dev>

pkgname=marktext
pkgver=0.16.1
pkgrel=1
pkgdesc='A simple and elegant open-source markdown editor that focused on speed and usability'
arch=('x86_64')
url='https://github.com/marktext/marktext'
license=('MIT')
provides=('marktext')
conflicts=('marktext-bin' 'marktext-git')
depends=('libxkbfile')
makedepends=('nodejs' 'npm' 'python2' 'tar')
source=("https://github.com/marktext/marktext/archive/v${pkgver}.tar.gz")
sha512sums=('b2ef1fa46cef87bac056e2655565122fba323d0af38166654e078c538de2297949ed8fe1d222791734341f30e86be1b3644e2dd4839d1de216f40af25a10165a')
install='marktext.install'

prepare() {
    cd "${pkgname}-${pkgver}"
    npx yarn --frozen-lockfile
}

build() {
    cd "${pkgname}-${pkgver}"
    node .electron-vue/build.js && npx electron-builder build --dir --linux pacman
}

package() {
    tar xf ${pkgname}-${pkgver}/build/marktext-*.pacman -C "${pkgdir}"

    rm -f "${pkgdir}/.INSTALL" "${pkgdir}/.MTREE" "${pkgdir}/.PKGINFO"

    chmod 755 "${pkgdir}/opt/Mark Text/marktext"
}
