# Maintainer: Jack L. Frost <fbt@fleshless.org>
# % Trigger: 1440186708 %

pkgname=fskit-git
pkgver=r259.2583ba1
pkgrel=1
pkgdesc='Filesystem utility library and SDK'
url='https://github.com/jcnelson/fskit.git'
arch=( 'x86_64' 'i686' )
license=( 'ISC' )
depends=( 'fuse' )
provides=( 'fskit' )

source=( "${pkgname}::git+https://github.com/jcnelson/fskit.git" )
sha1sums=( 'SKIP' )

pkgver() {
	cd "${pkgname}"

	if git_version=$( git describe --long --tags 2>/dev/null ); then
		IFS='-' read last_tag tag_rev commit <<< "$git_version"
		printf '%s.r%s.%s' "$last_tag" "$tag_rev" "$commit"
	else
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	fi
}

build() {
	cd "${pkgname}"
	make
}

package() {
	cd "${pkgname}"
	make DESTDIR="${pkgdir}" PREFIX='/usr' INCLUDE_PREFIX='/usr' install
}
