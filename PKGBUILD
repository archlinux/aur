# Maintainer: tomKPZ
pkgname=curse-downloader-git
pkgver=0.3.r62.766dc3c
pkgrel=1
pkgdesc="A simple script to download mods from a CurseForge Minecraft modpack."
arch=('any')
url="https://github.com/portablejim/curseDownloader"
license=('GPL3')
depends=('python>=3.4'
	'python-appdirs'
	'python-requests'
	'tk')
makedepends=('git')
source=("${pkgname}::git+https://github.com/portablejim/curseDownloader.git"
	'curse-downloader.sh'
	'curse-updater.sh')
sha256sums=('SKIP'
	'02fa8486e87d3eebcd56f7a323f5dcfb2d62974083517cac1106a8f50c80b92f'
	'a3f0badb7f52a1e634a00b6360ce44031fc53055013af9276dbebaa711e5c40e')

pkgver() {
	cd "${pkgname}"

	local version=$(grep "version=" "setup.py" | sed 's/ *version="\([0-9\.]\+\)",/\1/')
	printf "${version}.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}"

	mkdir -p "${pkgdir}/usr/share/curse-downloader"
	cp "${pkgname}/downloader.py" "${pkgdir}/usr/share/curse-downloader"
	cp "${pkgname}/updater.py" "${pkgdir}/usr/share/curse-downloader"
	install -Dm755 curse-downloader.sh "${pkgdir}/usr/bin/curse-downloader"
	install -Dm755 curse-updater.sh "${pkgdir}/usr/bin/curse-updater"
}
