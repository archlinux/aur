# Maintainer: Jack Random <jack(at)random(dot)to>
# previous maintainer: Aaron Tinio <aptinio at gmail dot com>
pkgname=chruby-git
pkgver=0.3.9.r53.4c46722
pkgrel=1
pkgdesc="Changes the current Ruby."
arch=('any')
url="https://github.com/postmodern/${pkgname%-git}"
license=('MIT')
depends=('bash>=3')
makedepends=('gnupg' 'git')
optdepends=('zsh')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url" 'profile.sh')
md5sums=('SKIP' 'ed2a77e37a4511b7253145624a775945')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make DESTDIR="$pkgdir/" PREFIX=/usr install
  install -Dm644 "$srcdir/profile.sh" "$pkgdir/etc/profile.d/chruby.sh"
}
