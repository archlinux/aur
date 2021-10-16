# Maintainer: Emil Rasmus Merzin <rasmusmerzin@gmail.com>
pkgname=osoy
pkgver=0.5.1
pkgrel=1
pkgdesc='Git repository manager'
arch=('i686' 'x86_64')
url='https://gitlab.com/osoy/osoy'
license=('MIT')
provides=('osoy')
makedepends=('cargo')
optdepends=('make')
source=("https://downloads.sourceforge.net/project/osoy/osoy-v0.5.1-src.tar.gz")
sha1sums=('f0bad1e418852dd12bcf3e36d8b1dfb3bc3ed390')
md5sums=('b5902e71a6697f711ebfe6eef0858fa2')

build() {
	cd "${srcdir}"
	make
}

package() {
	"${srcdir}/osoy" completions bash > "${srcdir}/bash"
	"${srcdir}/osoy" completions zsh > "${srcdir}/zsh"
	"${srcdir}/osoy" completions fish > "${srcdir}/fish"
	install -Dm755 "${srcdir}/osoy" "${pkgdir}/usr/bin/osoy"
	install -Dm644 "${srcdir}/bash" "${pkgdir}/usr/share/bash-completion/completions/osoy"
	install -Dm644 "${srcdir}/zsh" "${pkgdir}/usr/share/zsh/site-functions/_osoy"
	install -Dm644 "${srcdir}/fish" "${pkgdir}/usr/share/fish/vendor_completions.d/osoy.fish"
}
