# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=truepng
pkgver=0.6.2.5
_srcfile="TruePNG_${pkgver//./}.zip"
_extractdir="${_srcfile%.*}"
pkgrel=2
pkgdesc='An advanced and very efficient PNG image optimizer with lossless and lossy modes (uses wine)'
arch=('any')
url='http://x128.ho.ua/pngutils.html'
license=('unknown')
depends=('bash' 'wine')
makedepends=('git')
source=("$_srcfile"::"http://x128.ho.ua/clicks/clicks.php?uri=${_srcfile}"
        'git+https://github.com/dbermond/shellutils.git')
noextract=("$_srcfile")
sha256sums=('a20d7121bf377e9ddb2d7d04995bb4b032d523caeb7f7ea3360acad6bc5901ab'
            'SKIP')

prepare() {
    mkdir -p "$_extractdir"
    cd "$_extractdir"
    bsdtar -x -f "${srcdir}/${_srcfile}"
}

package() {
    install -D -m755 shellutils/image/truepng     -t "${pkgdir}/usr/bin"
    install -D -m644 "${_extractdir}/TruePNG.exe" -t "${pkgdir}/usr/share/truepng"
}
