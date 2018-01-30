# Maintainer: Joaquin Garmendia <joaquingc123 at gmail dot com>

# All my PKGBUILDs can be found in https://www.github.com/joaquingx/PKGBUILDs

pkgname=codeforces-parser-git
pkgver=r48.5287a01
pkgrel=2
pkgdesc="Parse sample tests of Codeforces Competitions, and generate tests automatically."
arch=("any")
url="https://github.com/johnathan79717/${pkgname%-git}"
license=('MIT')
depends=('python' 'time' 'python-urllib3')
makedepends=('git') 
optdepends=('go: for go support.'
            'kotlin: for kotlin support.')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=("git+${url}")
sha256sums=('SKIP')
install=${pkgname}.install


pkgver() {
	cd "${srcdir}/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


prepare(){
	cd ${pkgname%-git}
	sed -i "s/main.cc/\/etc\/${pkgname%-git}\/main.cc/" parse.py
	sed -i "s/main.go/\/etc\/${pkgname%-git}\/main.go/" parse.py
	sed -i "s/main.kt/\/etc\/${pkgname%-git}\/main.kt/" parse.py
}

package() {
	cd "${srcdir}/${pkgname%-git}"
	install -Dm755 parse.py "${pkgdir}/usr/bin/${pkgname%-git}"
	install -Dm644 LICENSE  "${pkgdir}/usr/share/license/${pkgname%-git}/LICENSE"
	mkdir -p "${pkgdir}/etc/${pkgname%-git}"
	cp main.{go,cc,kt} "${pkgdir}/etc/${pkgname%-git}/"      
}
