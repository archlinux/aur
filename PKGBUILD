# Maintainer: Jakub Klinkovský <lahwaacz@archlinux.org>

_name=DarkMode
pkgname=mediawiki-extension-${_name,,}
pkgver=1.44+r236+g23479bf
pkgrel=1
_mw=1.44
_commit=23479bf7dccfbddf669516b956c32910c23a5f6e # git rev-parse "REL${_mw/./_}"
pkgdesc='An extension for MediaWiki that adds a link to toggle a dark mode theme'
arch=(any)
url='https://www.mediawiki.org/wiki/Extension:DarkMode'
license=(MIT)
makedepends=(git)
source=("git+https://gerrit.wikimedia.org/r/mediawiki/extensions/$_name.git#commit=$_commit")
b2sums=('dad038cc63f45ac2f7b38d18297fa3f842ccb1c93aee21eeb7646fb7c281b2bd91a5c618904bd8b8ac48c94a7397417d65f22de1fbea5a9089a39d306c5c0e98')

pkgver() {
	cd $_name
	printf '%s+r%s+g%s' "$_mw" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	install -vdm 755 "$pkgdir"/usr/share/webapps/mediawiki/extensions/
	cp -r $_name "$pkgdir"/usr/share/webapps/mediawiki/extensions/

	# remove git internal directory
	rm -r "$pkgdir"/usr/share/webapps/mediawiki/extensions/$_name/.git/

	# install license
	install -vDm 644 $_name/COPYING -t "$pkgdir"/usr/share/licenses/$pkgname/
}
