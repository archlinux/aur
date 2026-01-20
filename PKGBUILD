# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appauthor=ClementNerma
_appname=ReShell
_execname=${_appname,,}
pkgname=${_execname}-bin
pkgver=0.1.0_1524
pkgrel=1
pkgdesc="A modern shell for the future"
arch=('x86_64' 'aarch64')
url="https://github.com/${_appauthor}/${_appname}"
_urlraw="https://raw.githubusercontent.com/${_appauthor}/${_appname}/v${pkgver//_/-}"
license=('Apache-2.0')

depends=()
provides=("${_appname}")
conflicts=("${_appname}")

install=reshell.install

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE.md"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "TUTORIAL-${pkgver}.md::${_urlraw}/docs/Tutorial.md"
        "fibonacci-memoized-${pkgver}.rsh::${_urlraw}/examples/fibonacci-memoized.rsh"
        "fibonacci-${pkgver}.rsh::${_urlraw}/examples/fibonacci.rsh"
        "guess-${pkgver}.rsh::${_urlraw}/examples/guess.rsh")
source_x86_64=("${pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/v${pkgver//_/-}/${_appname}-repl-${arch[0]}-unknown-linux-musl.tgz")
source_aarch64=("${pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/v${pkgver//_/-}/${_appname}-repl-${arch[1]}-unknown-linux-musl.tgz")
sha256sums=('efe25c1d429a558b4c784691119aa8c3dfee24910f4cb0e97b79bc0a79fd2cc1'
            '37cf555782d1c9377100e98ce74780ab2b77da1c9572cec7411cdfb11d142c32'
            'e9178feb32e578858b2894cc084831182e50b6b5def6c22ed53f78eebc3fca67'
            '4de35e1288bd083b3eb3dfa609c13d7f6b270c34d8bff7c8f2bd779591b7eac1'
            '343653a05fb09514b663de3828019ea0ab50df0898ac94789d0bdbff950f935d'
            '306c6c95be38ddc4eb30e1b28413ea3a7e13d1767ff7a85a4802f7b70fbfeba8')
sha256sums_x86_64=('3ac286727a7103d04fa3e999767f65a97cc8589f58d2d5202086888ee838a004')
sha256sums_aarch64=('a126ebc8dfa00917147d97cc3de02ecc9f171297d97a8ec88e963cd77b8c6c46')

prepare() {
	cd "${srcdir}/" || exit

	sed -i '1s/^/#! \/bin\/reshell\n/' *.rsh
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_execname}" "${pkgdir}/usr/bin/${_execname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "TUTORIAL-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/TUTORIAL.md"

	install -Dm755 "fibonacci-memoized-${pkgver}.rsh" "${pkgdir}/usr/share/${_execname}/examples/fibonacci-memoized.rsh"
	install -Dm755 "fibonacci-${pkgver}.rsh" "${pkgdir}/usr/share/${_execname}/examples/fibonacci.rsh"
	install -Dm755 "guess-${pkgver}.rsh" "${pkgdir}/usr/share/${_execname}/examples/guess.rsh"
}
