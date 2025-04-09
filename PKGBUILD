# Maintainer: oldkingOK <oldkingok.creeper@gmail.com>
pkgname=pyinstxtractor-git
_pkgname="${pkgname%-git}"
pkgver=r61.bb936f9
pkgrel=1
pkgdesc="PyInstaller Extractor"
arch=('any')
license=('GPL-3.0-only')
depends=('python')
url="https://github.com/extremecoders-re/${_pkgname}"
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${_pkgname}"
    local _latest_tag="$(git describe --abbrev=0 --tags)" 
    local _main="${_pkgname}.py"

    install -Dm644 "${srcdir}/${_pkgname}/${_main}" "${pkgdir}/usr/share/${_pkgname}/${_main}"
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${_pkgname}" << END
#!/usr/bin/env sh
python3 /usr/share/${_pkgname}/${_main} "\$@"
END
}
