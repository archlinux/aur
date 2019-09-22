# Maintainer: Jacob Mischka <jacob@mischka.me>
# Maintainer: Brokenpip3 <brokenpip3[at]gmail[dot]com>

pkgname=notes-git
pkgver=0.5.0.r6.ge3a9eab
pkgrel=1
pkgdesc="Simple delightful note taking, with more unix and less lock-in."
arch=('any')
url="https://github.com/pimterry/notes"
license=('MIT')
depends=('bash')
makedepends=('git')
provides=('notes')
source=('git+https://github.com/pimterry/notes.git')
md5sums=('SKIP')

_pkgname=notes

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$srcdir/$_pkgname"
	install -D ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 ${_pkgname}.bash_completion "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
    install -Dm644 ${_pkgname}.1 "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 config "${pkgdir}/usr/share/${_pkgname}/config.example"
}
