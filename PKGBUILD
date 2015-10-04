# Maintainer: Youngbin Han <sukso96100@gmail.com>
# Submitter: Youngbin Han <sukso96100@gmail.com>

pkgname=irccloud-electron-git
_pkgname=IRCCloud
pkgver=42.13d2e17
pkgrel=1
pkgdesc="Mac App, Win App and Linux app for IRCCloud. (An Electron wrapper for IRCCloud.) "
arch=('any')
url="https://github.com/dalinaum/${_pkgname}"
license=('MIT')
depends=('nodejs')
makedepends=('nodejs' 'npm' 'git' 'wget')
source=("${_pkgname}"::"git+https://github.com/dalinaum/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}"
	wget "https://aur.archlinux.org/cgit/aur.git/plain/irccloud-election.desktop?h=irccloud-electron-git" -o ./irccloud-election.desktop
}

build() {
  cd "${srcdir}/${_pkgname}"
  npm install
  rm -rf dist
  mkdir dist
  ./build-linux.js ${_pkgname} $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd "${srcdir}"
	install -Dm644 irccloud-election.desktop "$pkgdir/usr/share/applications/irccloud-election.desktop"
  install -Dm644 "${srcdir}/${_pkgname}" "$pkgdir/usr/share/irccloud-election"
}
