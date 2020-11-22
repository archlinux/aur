# Maintainer: Ruben Solvang <post@rubensolvang.no>
pkgname=nbno-git
pkgver=r32.b08c399
pkgrel=1
pkgdesc="A Python script that downloads books from nb.no (Nasjonalbiblioteket)"
arch=('any')
url="https://github.com/Lanjelin/NBNO.py"
license=('GPL3')
depends=('python>=3.7' 'python-pillow>=6.0')
source=("$pkgname::git+https://github.com/Lanjelin/NBNO.py.git")
md5sums=('SKIP')

pkgver() {
	cd "${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}"/${pkgname}
	install -dm 755 ${pkgdir}/usr/bin
	sed -i '1i #!/usr/bin/env python' nbno.py
	install -Dm 755 ./nbno.py ${pkgdir}/usr/bin
	chmod +x "${pkgdir}/usr/bin/nbno.py"
}
