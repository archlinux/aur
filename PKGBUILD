# Maintainer: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Original Contributor: DonVla <donvla@users.sourceforge.net>

pkgname=clean-home
_dirname_=cleanHome
pkgver=0.8
pkgrel=1
pkgdesc="Cleans up user's home directory by analyzing '.' config files/directories against a collaboratively maintained database"
arch=("any")
url="http://cleanhome.sourceforge.net/"
license=("GPL2")
depends=("perl" "perl-libwww")
optdepends=("firefox: for BrowserCall plugin" "opera: for BrowserCall plugin")
options=(!emptydirs)
source=(http://downloads.sourceforge.net/sourceforge/cleanhome/${_dirname_}-${pkgver}.tar.gz)

build() {
	cd "${srcdir}"/${_dirname_}

	# Patches
	patch -Np0 < "${startdir}"/plugin-location.patch
	#  optional: uncomment if you want to use opera
	#  patch -Np0 < "${startdir}"/opera-as-browser.patch

	# Removals
	rm "CHPlugins/AptCacheInfo.pm" "CHPlugins/DiskUsage.pm" "CHPlugins/DpkgInstallState.pm"
}

package() {
	cd "${srcdir}"/${_dirname_}

	# Directories
	install -d "${pkgdir}"/usr/{share/${_dirname_}/,bin/}

	# Application
	cp -r * "${pkgdir}"/usr/share/${_dirname_}/
	#for file in CHPlugins/*; do
	#	install -m 0644 "$file" "${pkgdir}"/usr/share/${_dirname_}
	#done

	# Binaries
	#install -D -m 0755 "cleanhome.pl" "${pkgdir}"/usr/bin/${pkgname}
	ln -s /usr/share/${_dirname_}/cleanhome.pl "${pkgdir}"/usr/bin/${pkgname}
}

sha1sums=('58545185bc63b5b4aceb23e6a699b69bd0a50e24')
