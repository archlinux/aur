# Maintainer: Maik93 <michael.mugnai@gmail.com>
# Contributor: AUTplayed <fips.hem@gmail.com>
# Contributor: pavanjadhaw <pavanjadhaw96@gmail.com>

_pkgname=betterlockscreen
pkgname=${_pkgname}-git
provides=("betterlockscreen")
conflicts=("betterlockscreen")
pkgver=v4.1.0.r0.ga4eeddf
pkgrel=1
pkgdesc="A simple lock script for i3lock-color"
arch=('any')
url="https://github.com/betterlockscreen/betterlockscreen"
_git_branch="next"
license=('MIT')
makedepends=('git')
depends=('i3lock-color>=2.13.c.3-1' 'imagemagick' 'xorg-xrandr' 'xorg-xdpyinfo' 'bc')
optdepends=('feh: Allows setting wallpaper')
source=("${_pkgname}::git+${url}.git#branch=$_git_branch")
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$_pkgname"

	# install executable
	install -Dm 755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"

	# install systemd user service
    sed -i 's,usr/local,usr,' "system/$_pkgname@.service"
	install -Dm 644 "system/$_pkgname@.service" "$pkgdir/usr/lib/systemd/system/$_pkgname@.service"

	# add config example and LICENCE files
	install -Dm 644 "examples/${_pkgname}rc" "$pkgdir/usr/share/doc/$_pkgname/examples/${_pkgname}rc"
	install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENCE"
}
