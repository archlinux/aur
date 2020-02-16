# Maintainer: Einhard Leichtfuß <alguien@respiranto.de>

_extname=MagicNoCache
_extname_lowercase="${_extname,,}"
_pkgname_base="mediawiki-extension-${_extname_lowercase}"

pkgname="${_pkgname_base}-git"
pkgver=1.4.0.r18.g21cb197
pkgrel=1
pkgdesc="MediaWiki extension for selective cache disabling"
arch=('any')
url="https://www.mediawiki.org/wiki/Extension:${_extname}"
license=('GPL')
depends=('mediawiki')
makedepends=('git')
provides=("$_pkgname_base")
conflicts=("$_pkgname_base")
source=("git+https://gerrit.wikimedia.org/r/mediawiki/extensions/${_extname}")
sha512sums=('SKIP')

pkgver()
{
	cd "${_extname}"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package()
{
	local ext_dir="${pkgdir}/usr/share/webapps/mediawiki/extensions"

	install -d -m755 "$ext_dir"
	cp -a "$_extname" "${ext_dir}/"
}
