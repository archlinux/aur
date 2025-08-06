# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=seeyebe
_pkgname=dude
pkgname=${_pkgname}-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="A single-binary helper that discovers, previews and removes pacman orphans"
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('Apache-2.0' 'MIT')

depends=('gcc-libs' 'glibc' 'pacman')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-APACHE-${pkgver}::${_urlraw}/LICENSE-APACHE"
        "LICENSE-MIT-${pkgver}::${_urlraw}/LICENSE-MIT"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "${_pkgname}-${pkgver}.hook::${_urlraw}/hooks/dude.hook")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver//0\.1\.0/0\.1\.1}-${arch[0]}-notify.tar.zst")
sha256sums=('58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd'
            '6d9d4f05cee53e12936415b68727492c083f80073313787ab13b720d840bfb34'
            '83e55e082ef396c6b632f12ddbd576a1a0da16ff5985973f1fb8f1b4b98fa8ee'
            '7b9ef2f3db7150f04f4af8fe33ecad3d37a647f1bc0b5f21980617fd6989a863')
sha256sums_x86_64=('cc35f686f4b647f62fc8fc186e279ac07ffc6790cc26434e0959f83fd0e08183')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "${_pkgname}-${pkgver}.hook" "${pkgdir}/usr/share/libalpm/hooks/${_pkgname}.hook"

	install -Dm644 "LICENSE-APACHE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
	install -Dm644 "LICENSE-MIT-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
