# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=caelansar
_pkgname=caescript
pkgname=${_pkgname}-bin
pkgdesc="Dialect of Monkey programming language"

pkgver=0.1.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64' 'aarch64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'gcc-libs')

source=("hello.cae" "fibonacci.cae"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE"
		"README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[0]}-unknown-linux-gnu.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[1]}-unknown-linux-gnu.tar.gz")
sha256sums=('daf86dff63debd796563dbbfb4ca750605a94c4398a121293cc0a59ede8b902b'
            'a268c79fd411efac9624fda078f8214fd5174a056629387ac7c720169e57d332'
            '354e8a4cdba414b7c23647dbbef29159dc1141051814e6e4193c03d58991e819'
            '8b624a9f738ef03c17932b9aa327ea06ff91e229dc885a9418e60e0a84df84fa')
sha256sums_x86_64=('5d6a1998c1767d4f13612f4c5fb127c54bde93db4903260b5f14bbebeb4932cc')
sha256sums_aarch64=('7cd04cd4cecce492988310f0635a08c7370a7fb0116d383316127ce4c6226a61')

prepare() {
	cd "${srcdir}/" || exit

	mkdir -p ./examples
	mv ./*.cae ./examples
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	for example in ./examples/*.cae; do
		install -Dm644 ${example} "${pkgdir}/usr/share/${_pkgname}/examples/$(basename ${example})"
	done

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
