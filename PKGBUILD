# Maintainer: Yiyao Yu <yuydevel at protonmail dot com>
# Author: Gui Meira

_pkgname=i3lock-fancy-multimonitor
pkgname="${_pkgname}-git"
pkgver=r0.0
pkgrel=0
pkgdesc="Blurry lock screen for i3lock with multimonitor support"
license=('MIT')
url="https://github.com/guimeira/i3lock-fancy-multimonitor"
arch=('any')
provides=('i3lock-fancy')
conflicts=('i3lock-fancy-git')
makedepends=('git')
depends=('bash' 'i3lock' 'imagemagick' 'scrot' 'xorg-xrandr')
source=("${_pkgname}::git+${url}.git"
		"i3lock-fancy")
sha256sums=('SKIP'
			'd33c278ca5108105e7ba8d591429e825a3351e39cb35f38330d3ce6a4638fb8c')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -Dm 755 i3lock-fancy "${pkgdir}/usr/bin/i3lock-fancy"

	cd "${srcdir}/${_pkgname}"
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -Dm 755 lock "${pkgdir}/usr/share/${_pkgname}/lock"
	install -m 644 -t "${pkgdir}/usr/share/${_pkgname}" *.png
}
