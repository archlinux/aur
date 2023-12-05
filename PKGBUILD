# Maintainer: lakejason0 <lakesarchive@outlook.com>

_skinname=Lakeus
_skinname_lowercase="${_skinname,,}"
_pkgname_base="mediawiki-skin-${_skinname_lowercase}"

pkgname="${_pkgname_base}-git"
pkgver=1.1.15.r59.g5d7acdd
pkgrel=1
pkgdesc="Lakeus is a MediaWiki skin that aims to provide a simple but all-functional experience, named after a character in the novel of one of the authors, Lakejason0."
arch=('any')
url="https://www.mediawiki.org/wiki/Skin:${_skinname}"
license=('GPL3')
depends=('mediawiki')
makedepends=('git')
provides=("$_pkgname_base")
conflicts=("$_pkgname_base")
source=("git+https://github.com/lakejason0/mediawiki-skins-Lakeus.git")
sha512sums=('SKIP')

pkgver()
{
	cd "mediawiki-skins-$_skinname"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package()
{
	local skin_dir="/usr/share/webapps/mediawiki/skins/${_skinname}"

	install -d -m755 "${pkgdir}${skin_dir}"
	cd "mediawiki-skins-${_skinname}"
	find . -mindepth 1 -maxdepth 1 -regextype posix-extended \
		\! -regex './\.git(|ignore|review)' \
		-exec cp -RP '{}' "${pkgdir}${skin_dir}/" \;
}
