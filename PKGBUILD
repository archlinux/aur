# Maintainer: fossdd <fossdd@pwned.life>
pkgname=dodo-mail-git
_pkgname="${pkgname%-git}"
pkgver=r223.ed02090
pkgrel=1
pkgdesc='A graphical, hackable email client based on notmuch'
arch=('any')
url="https://github.com/akissinger/dodo"
license=('GPL3')
groups=()
depends=(
	'python'
	'python-bleach'
	'python-pyqt6'
	'python-pyqt6-webengine'
	'hicolor-icon-theme'
	'notmuch'
	'w3m'
)
makedepends=(
	'git'
	'python-setuptools'
)
optdepends=(
	'offlineimap: check mail and sync with a local maildir'
	'msmtp: a sendmail-compatible SMTP client to send mail'
	'python-gnupg: pgp/mime support'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
replaces=()
backup=()
options=()
install="$_pkgname.install"
source=("$_pkgname::git+$url")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	# Git, tags available
	# printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
	# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
	cd "$srcdir/$_pkgname"
	python setup.py build
}

package() {
	cd "$srcdir/$_pkgname"
	python setup.py install --root="$pkgdir" --optimize=1
}
