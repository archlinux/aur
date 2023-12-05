# Maintainer: lakejason0 <lakesarchive@outlook.com>

_extensionname=EditCountNeue
_extensionname_lowercase="${_extensionname,,}"
_pkgname_base="mediawiki-extension-${_extensionname_lowercase}"

pkgname=${_pkgname_base}-git
pkgver=0.4.3.r4.ge4b9a14
pkgrel=1
pkgdesc='EditCountNeue MediaWiki extension allows wikis to display the number of edits of a user, via a special page or a parser function.'
arch=('any')
url='https://www.mediawiki.org/wiki/Extension:EditCountNeue'
license=('GPL')
depends=('mediawiki')
makedepends=('git')
source=("git+https://github.com/AlPha5130/mediawiki-extensions-EditCountNeue.git")
sha512sums=('SKIP')

pkgver() {
	cd "mediawiki-extensions-$_extensionname"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	local extension_dir="/usr/share/webapps/mediawiki/extensions/${_extensionname}"

	install -d -m755 "${pkgdir}${extension_dir}"
	cd "mediawiki-extensions-${_extensionname}"
	find . -mindepth 1 -maxdepth 1 -regextype posix-extended \
		\! -regex './\.git(|ignore|review)' \
		-exec cp -RP '{}' "${pkgdir}${extension_dir}/" \;
}
