## Maintainer: pyamsoft <pyam.soft@gmail.com>

pkgname=steam-wrapper-git
_gitname=steam-wrapper
pkgdesc="Steam wrapper for common operations (git version)"
pkgver=0.1.8.git
pkgrel=1
arch=('i686' 'x86_64')
optdepends=('steam-native: Native runtime library support')
depends=('steam' 'bash' 'coreutils')
makedepends=('git')
provides=('steam-wrapper')
conflicts=('steam-wrapper')
license=('custom')
url="https://github.com/pyamsoft/steam-wrapper.git"
source=("${_gitname}::git+${url}#branch=dev")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_gitname"
	echo "$(awk -F '=' '{if (/^VERSION=/) {print $2}}' 'steam-wrapper').git"
}

package() {
	cd "$srcdir/$_gitname"

	# Install the script
	mkdir -p "$pkgdir"/usr/bin/
	cp "${_gitname}" "$pkgdir"/usr/bin/
	chmod 755 "$pkgdir"/usr/bin/${_gitname}

	# Install the desktop file
	mkdir -p "$pkgdir"/usr/share/applications/
	cp ${_gitname}.desktop "$pkgdir"/usr/share/applications/
	chmod 644 "$pkgdir"/usr/share/applications/${_gitname}.desktop

	# Install the default configuration
	mkdir -p "$pkgdir"/etc/steam-wrapper/
	cp ${_gitname}.conf "$pkgdir"/etc/${_gitname}/${_gitname}.conf
	chmod 644 "$pkgdir"/etc/${_gitname}/${_gitname}.conf
}

