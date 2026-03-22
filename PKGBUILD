# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: FixFromDarkness <aur@forestfox.tk>
# Contributor: Asuka Minato

_pkgauthor=szabodanika
_pkgname=microbin
pkgname=${_pkgname}-bin
pkgver=2.1.0
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="A tiny, self-contained, configurable paste bin and URL shortener written in Rust."

arch=('x86_64' 'i686' 'arm' 'armv7h' 'aarch64')
_barch=('x86_64-unknown-linux-musl' 'i686-unknown-linux-musl' 'arm-unknown-linux-musleabihf' 'armv7-unknown-linux-musleabihf' 'aarch64-unknown-linux-musl')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('BSD-3-Clause')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

backup=("etc/${_pkgname}/${_pkgname}.env")

install="${pkgname}.install"

source=("${_pkgname}.env"
		"${_pkgname}.service"
		"${_pkgname}.sysusers"
		"${_pkgname}.tmpfiles"
		"${pkgname}.install"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE"
		"README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[0]}.tar.gz")
source_i686=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/microbin-v${pkgver}-${_barch[1]}.tar.gz")
source_arm=("${_pkgname}-${arch[2]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/microbin-v${pkgver}-${_barch[2]}.tar.gz")
source_armv7h=("${_pkgname}-${arch[3]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/microbin-v${pkgver}-${_barch[3]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[4]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/microbin-v${pkgver}-${_barch[4]}.tar.gz")
sha256sums=('583df49c44bceb7f93f712caf3eaa33170e49d2a345f85c5a6e11256772e1af9'
            'bf3a8c07168be42a531e76d906e098a13f186d123ad995d908b9e20563fca328'
            '40ae0f45c7c779dc8e8e68955144a56bb71f710564eb1500193912ed53e844e1'
            '625d8ee0470bc79ad1b03c870161cb26506a4a407c971a296abc7ad6dbf81783'
            '15a4e601622a4e80fcf5f564f526f98e43f3fe69335d3c84e7d06fcbb5378fce'
            '71fa5b8c867abe6101bc3114d5d93595f3fe5da2275afdd329999aa5303e8fa4'
            'da9be6d63444e8a1566e6853512cb52969be22dd875296da6ce519d064f1076e')
sha256sums_x86_64=('3d6285b4520340c0611875916a7b1dbfa880973541f044c3d18efce799725f45')
sha256sums_i686=('df9a2466d1deba16246e5256d04bf04071bb320e105e97795f53c37be633e86f')
sha256sums_arm=('efb1a9c246fc26c9c47e78be7a52703af3e8af737f1c71b796d49748dd54401c')
sha256sums_armv7h=('c27a3ce3d1b417d095660aa6c7d4daae1340412374a1824573636fc2d8f90469')
sha256sums_aarch64=('d85f2259404587b1b7b6e585d9fc63e53b0253294cd0a96593ecb0355228f88a')

package() {
	install -Dm0755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "${_pkgname}.env" "${pkgdir}/etc/${_pkgname}/${_pkgname}.env"

	install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"

	install -Dm644 "${_pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
	install -Dm644 "${_pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
