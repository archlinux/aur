# Maintainer: Einhard Leichtfuß <alguien@respiranto.de>

_extname=Lockdown
_extname_lowercase="${_extname,,}"
_pkgname_base="mediawiki-extension-${_extname_lowercase}"

pkgname="${_pkgname_base}-git"
pkgver=r149.6e1e8cc
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
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package()
{
	local ext_dir="${pkgdir}/usr/share/webapps/mediawiki/extensions"

	install -d -m755 "$ext_dir"
	cp -a "$_extname" "${ext_dir}/"
}
