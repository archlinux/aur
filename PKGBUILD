# Maintainer: Jack Random <jack(at)random(dot)to>
# previous maintainer: Aaron Tinio <aptinio at gmail dot com>
pkgname=ruby-install-git
pkgver=0.7.0.r7.ea2b8bb
pkgrel=1
pkgdesc="Installs Ruby, JRuby, Rubinius, TruffleRuby or mruby."
arch=('any')
url="https://github.com/postmodern/${pkgname%-git}"
license=('MIT')
depends=('bash>=3' 'curl' 'tar' 'bzip2' 'gcc')
makedepends=('git')
optdepends=('patch: for specifying any additional patches to apply')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" PREFIX=/usr install
}
