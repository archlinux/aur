# Mantainer: Philipp Koppenstein philipp@koppenstein.com

_pkgname=pandocode
pkgname="python-${_pkgname}-git"
pkgver='20190524.5c8c531'
pkgrel=1
pkgdesc='pandocode is a pandoc filter that converts Python (-like) code to LaTeX-Pseudocode.'
source=("${_pkgname}::git+https://github.com/nzbr/pandocode.git")
depends=('pandoc-panflute' 'python' 'python-setuptools' 'zip')
license=('ISC')
arch=('any')

makedepends=('python-pylint')
provides=("python-${_pkgname}")
conflicts=("python-${_pkgname}")

sha1sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
	cd "$srcdir/${_pkgname}"
	sed -i 's:@install -D -m 755 $(OUT) $(PREFIX)/bin/$(NAME):@install -D -m 755 $(OUT) $(PREFIX)/$(NAME):g' makefile 	
	make
}

package() {
	cd "$srcdir/${_pkgname}"
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}

