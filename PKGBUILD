# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Andrew Jackson <andrew@thrasher.io>
pkgname=gocryptotrader-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=r1105.473092a6
pkgrel=1
pkgdesc='A cryptocurrency trading bot supporting multiple exchanges written in Golang.'
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/thrasher-corp/gocryptotrader"
license=('MIT')
makedepends=('git' 'go' 'make')
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")

source=('gocryptotrader::git+https://github.com/thrasher-corp/gocryptotrader')
noextract=()
md5sums=('SKIP')
md5sums=('SKIP')



pkgver() {
	cd "$srcdir/gocryptotrader"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
	cd "$srcdir/gocryptotrader"
	make build
}


package() {
	cd "$srcdir/gocryptotrader"
	install -Dm644 config_example.json "${pkgdir}/usr/share/gocryptotrader/config.json"
	printf "Config example has been copied to /usr/share/gocryptotrader/config.json"
	make install
}
