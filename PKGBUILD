# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=truepng
pkgver=0.6.2.4
_srcfile="TruePNG_$(printf '%s' "$pkgver" | sed 's/\.//g').zip"
_extractdir="${_srcfile%.*}"
pkgrel=2
pkgdesc='An advanced and very efficient PNG image optimizer with lossless and lossy modes (uses wine)'
arch=('i686' 'x86_64')
url='http://x128.ho.ua/pngutils.html'
license=('unknown')
depends=('wine')
options=('!strip')
source=("$_srcfile"::"http://x128.ho.ua/clicks/clicks.php?uri=${_srcfile}"
        'shellutils-git'::'git+https://github.com/dbermond/shellutils.git')
noextract=("$_srcfile")
sha256sums=('9b735e660e8a39c37bd8239e10f3dd74b39b9e251f70fd8273b82c7ffc835959'
            'SKIP')

prepare() {
    mkdir -p "$_extractdir"
    cd       "$_extractdir"
    bsdtar -x -f "${srcdir}/${_srcfile}"
}

package() {
    install -D -m755 "shellutils-git/image/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -D -m644 "${_extractdir}/TruePNG.exe"      "${pkgdir}/usr/share/${pkgname}/TruePNG.exe"
}
