# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgbase=lalezar
pkgname=("eot-${pkgbase}" "ttf-${pkgbase}" "otf-${pkgbase}" "woff-${pkgbase}" "woff2-${pkgbase}")
pkgver=1.003
pkgrel=1
pkgdesc="A multi-script display typeface for popular culture."
arch=('any')
url="https://github.com/BornaIz/Lalezar"
license=('OFL')
source=("${pkgbase}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('2499e68992cc1aa74dcc758031a9e5eced40d38a3af8ff3d0751c5863ec73371')

function _package() {
	cd "${pkgbase^}-${pkgver}"
	local ext="${1%%-*}"
	local installdir="${ext^^}"
	local font="$(find 'Font files' 'Web fonts' -type f -name \*.${ext})"
	install -dm755 "${pkgdir}/usr/share/fonts/${installdir}"
	install -m644 "${font}" "${pkgdir}/usr/share/fonts/${installdir}/"
	install -Dm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

for _pkgname in ${pkgname[@]}; do
    eval "function package_$_pkgname() { _package $_pkgname; }"
done

# vim:set ts=4 sw=4:
