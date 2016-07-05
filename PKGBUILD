pkgname=toxygen-git
_pkgname=toxygen
pkgdesc="Toxygen is cross-platform Tox client written in Python3"
pkgrel=1
pkgver=0.2.0.423
arch=('i686' 'x86_64')
conflicts=("toxygen")
provides=("toxygen")
url="https://github.com/xveduk/toxygen"
license=('GPL-3.0')
depends=('python' 'toxcore' 'python-pyside' 'python-pyaudio')
makedepends=('git' 'gendesk')
source=('git://github.com/xveduk/toxygen.git')
sha256sums=('SKIP')

prepare(){
	gendesk -f --pkgname "Toxygen" --pkgdesc "$pkgdesc" --exec 'python /opt/toxygen/src/main.py'
}

pkgver() {
	cd "$_pkgname/src"
	echo "$(python -c "print(__import__('util').program_version)").$(git rev-list --count HEAD)"
}

build() {
	cd $_pkgname
	# ..
}

package() {
	install -Dm644 "Toxygen.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
	cd $_pkgname
	install -d "$pkgdir/opt/toxygen"
	cp -r "src" "$pkgdir/opt/toxygen"
	echo ""
}
