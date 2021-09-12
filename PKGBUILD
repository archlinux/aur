# Maintainer: Emil Rasmus Merzin <rasmusmerzin@gmail.com>
pkgname=osoy
pkgver=0.5.0
pkgrel=1
pkgdesc='Git repository manager'
arch=('i686' 'x86_64')
url='https://gitlab.com/osoy/osoy'
license=('MIT')
provides=('osoy')
makedepends=('cargo')
source=("https://downloads.sourceforge.net/project/osoy/osoy-v${pkgver}-src.tar.gz")
sha1sums=('965b78cba7eefb0dff68e6ac940a504345a41ab3')
md5sums=('76509d41b8e79a330c4e0549520d47d9')

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
