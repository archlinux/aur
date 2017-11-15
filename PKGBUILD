# Maintainer: nomisge <nomisge@live.de>
pkgname=hide-ff-title-bar-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=r16.aee86d1
pkgrel=1
pkgdesc="Hide the firefox title bar, for GNOME. This package provides the native helper (a Python script) for the firefox addon."
arch=('any')
url="https://github.com/GKFX/hide-ff-title-bar"
license=('MPL')
groups=()
depends=('firefox>=57.0' 'python>=3.5' 'wmctrl')
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/GKFX/hide-ff-title-bar.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	# following code is taken from build.sh
	mkdir -p "$pkgdir/usr/lib/mozilla/native-messaging-hosts/"
	mkdir -p "$pkgdir/opt/hide-ff-title-bar/"
	cp "native/hide_title_bar.json" "$pkgdir/usr/lib/mozilla/native-messaging-hosts/"
	cp "native/native.py" "$pkgdir/opt/hide-ff-title-bar/"
}
