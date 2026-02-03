# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appauthor=ClementNerma
_appname=ReShell
_execname=${_appname,,}
pkgname=${_execname}-bin
pkgver=0.1.0_1530
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
            '1e6ec244152059358872c9d1bfbb538d1a7a9da6fd269b7cda6e5d156150139d'
            'e9178feb32e578858b2894cc084831182e50b6b5def6c22ed53f78eebc3fca67'
            '4de35e1288bd083b3eb3dfa609c13d7f6b270c34d8bff7c8f2bd779591b7eac1'
            '343653a05fb09514b663de3828019ea0ab50df0898ac94789d0bdbff950f935d'
            '306c6c95be38ddc4eb30e1b28413ea3a7e13d1767ff7a85a4802f7b70fbfeba8')
sha256sums_x86_64=('945a0ba20a07c8fbd57f5c8595fd08fb5fb58f73bc3cc262b1ba99d1fb94946c')
sha256sums_aarch64=('36fbe944430266ea04381c3ded0fe6b6288bbd6b4788a5c5874d5206aff4b6e3')

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
