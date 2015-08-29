# Maintainer: Aaron Ali <t0nedef@causal.ca>
pkgname=vimeo-dl-git
pkgver=20130321
pkgrel=2
pkgdesc="A command line script to download vimeo videos"
arch=('any')
license=('custom')
#url='http://ossguy.com/?p=841'
url='https://github.com/johnteslade/vimeo-downloader'
depends=('wget')
makedepends=('git')
conflicts=('vimeo-dl')
provides=('vimeo-dl')
replaces=('vimeo-dl')

_gitroot="git://github.com/johnteslade/vimeo-downloader.git"
_gitname="vimeo-downloader"

build() {
	cd ${srcdir}/
	msg "Connecting to the GIT server...."
	if [[ -d ${srcdir}/${_gitname} ]] ; then
		cd ${_gitname}
		git pull origin
		msg "The local files are updated..."
	else
		git clone ${_gitroot}
	fi
	msg "GIT checkout done. Building."
}

package() {
	mkdir -p ${pkgdir}/usr/share/licenses/vimeo-dl
	sed -n '/Copyright/,/ SOFTWARE\./p' ${srcdir}/${_gitname}/vimeo_downloader.sh > ${pkgdir}/usr/share/licenses/vimeo-dl/LICENSE
	install -Dm644 ${srcdir}/${_gitname}/README.md ${pkgdir}/usr/share/vimeo-dl/README
	install -Dm755 ${srcdir}/${_gitname}/vimeo_downloader.sh ${pkgdir}/usr/bin/vimeo_downloader.sh
	ln -s vimeo_downloader.sh ${pkgdir}/usr/bin/vimeo-dl
}
#
