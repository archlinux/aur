# Maintainer: redfish <redfish at galactica dot pw>

pkgname='monero-core-git'
_gitname='monero-core'
pkgver=r186.6e5f5e1
pkgrel=1
arch=('x86_64' 'i686')
url="https://getmonero.org/"
license=('custom:Cryptonote')

depends=('libmonero-wallet-git'
	'openssl' 'boost-libs>=1.45'  'libunwind'
	'qt5-base' 'qt5-declarative' 'qt5-graphicaleffects'
	'qt5-location' 'qt5-quickcontrols' 'qt5-tools' 'qt5-webchannel'
	'qt5-webengine' 'qt5-x11extras' 'qt5-xmlpatterns')

makedepends=('git' 'cmake' 'boost')

pkgdesc="Official GUI for Monero, a private, secure, untraceable peer-to-peer currency"
provides=('monero-core')
conflicts=('monero-core')

source=("$_gitname::git+https://github.com/monero-project/monero-core.git")

md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_gitname"
	# TODO: switch to this one when upstream starts tagging releases
	#git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
        cd "$srcdir/$_gitname"
}

build() {
	cd "$srcdir/$_gitname"

	qmake
	make
}

package() {

	install -D -m755 "$srcdir/$_gitname/release/bin/monero-core" "$pkgdir/usr/bin/monero-core"
	install -D -m644 "$srcdir/$_gitname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
