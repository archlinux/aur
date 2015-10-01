# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Your Name <youremail@domain.com>
pkgname=libnotify-0.7.6-patched # '-bzr', '-git', '-hg' or '-svn'
pkgver=1
pkgrel=1
pkgdesc="Patched version of libnotify to replace notifications. Useful for hotkey notifications."
arch=('any')
url="https://gitlab.com/rich4rd.macwan/libnotify-0.7.6-patched"
license=('GPL')
groups=()
depends=()
makedepends=('git' 'make' 'gnome-common' 'gtk-doc' 'gobject-introspection') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname}")
conflicts=("libnotify")
replaces=()
backup=()
options=()
install=
#source=('https://gitlab.com/rich4rd.macwan/libnotify-0.7.6-patched/raw/master/libnotify-0.7.6-patched.tar.gz')
source=('https://git.gnome.org/browse/libnotify/snapshot/libnotify-0.7.6.tar.xz'
	'https://gitlab.com/rich4rd.macwan/libnotify-0.7.6-patched/raw/master/notifysend.patch'
	)

noextract=()

#md5sums=('7f06a4aea92b970fce5e0d4d8f3b7b37'
 #        'c404c151569f3379447fca61fa7fbeea')
md5sums=('SKIP' 'SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

prepare() {
	cd "$srcdir"
	#mkdir -p "${pkgname}" && tar -xvf ../libnotify-0.7.6.tar.xz -C "${pkgname}" --strip-components 1
	tar -xvf ../libnotify-0.7.6.tar.xz
	#cd libnotify-0.7.6
	pwd
	patch -p0 -i "notifysend.patch"

}

build() {
	cd "$srcdir/libnotify-0.7.6"
	./autogen.sh
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/libnotify-0.7.6"
	make -k check
}

package() {
	cd "$srcdir/libnotify-0.7.6"
	make DESTDIR="$pkgdir/" install
}
