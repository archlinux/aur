# Maintainer: Robert Ma (Hexcles) <bob1211@gmail.com>
# Submitter: Ariel Popper <a@arielp.com>

_gitname=powerline
pkgname="otf-powerline-symbols-git"
pkgver=20140317
pkgrel=1
pkgdesc='Fallback font for the Powerline symbols'
url='https://github.com/powerline/powerline'
license=('MIT')
arch=('any')
makedepends=('git')

source=("${_gitname}::git+https://github.com/powerline/powerline.git#branch=develop")
install=powerline-symbols.install
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_gitname}"
	git log -1 --format="%cd" --date=short font | sed 's|-||g'
}

package() {
	cd "${srcdir}/${_gitname}"

	install -dm755 "${pkgdir}/etc/fonts/conf.d"
	install -Dm644 "font/PowerlineSymbols.otf" "${pkgdir}/usr/share/fonts/OTF/PowerlineSymbols.otf"
	install -Dm644 "font/10-powerline-symbols.conf" "${pkgdir}/etc/fonts/conf.avail/10-powerline-symbols.conf"
	ln -s "../conf.avail/10-powerline-symbols.conf" "${pkgdir}/etc/fonts/conf.d/10-powerline-symbols.conf"
	
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
