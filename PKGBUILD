# Maintainer: DosAmp <bilderschleuder@gmail.com>
pkgname=sshlm-git
_pkgname="${pkgname%-git}"
pkgver=r64.26f3455
pkgrel=1
pkgdesc='Local line editing wrapper around ssh for high-latency links'
arch=('any')
url='https://github.com/mnalis/ssh-line-mode'
license=('GPL')
depends=('openssh' 'perl-io-pty-easy' 'perl-term-readkey' 'perl-term-readline-gnu')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("${_pkgname}::git+https://github.com/mnalis/ssh-line-mode.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$_pkgname"
	make prefix="/usr" DESTDIR="$pkgdir" install
	mkdir -p "${pkgdir}/usr/share/doc/$_pkgname"
	install -m644 BUGS.txt LICENSE README.md USAGE.txt "${pkgdir}/usr/share/doc/$_pkgname"
}
