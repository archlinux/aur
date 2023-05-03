# Maintainer: zhullyb <zhullyb [at] outlook dot com>
# Contributor: weearc <q19981121 [at] 163 dot com>
pkgname=motrix
_pkgname=Motrix
pkgver=1.8.19
pkgrel=2
epoch=
pkgdesc="A full-featured download manager (release version)"
arch=("x86_64")
url="https://github.com/agalwood/Motrix"
license=('MIT')
groups=()
depends=('gtk3' 'libxcb' 'electron22')
makedepends=('npm' 'yarn' 'nodejs' 'python')
checkdepends=()
optdepends=()
provides=()
conflicts=('motrix-git')
replaces=()
backup=()
options=()
install=
changelog=
source=("motrix.desktop"
    "motrix"
    "https://github.com/agalwood/Motrix/archive/v${pkgver}.tar.gz")
noextract=()
sha256sums=('af5092a2a599bd23c13303ad1e7b745992a7af141278d13abe4297ca50a77bd8'
            'bb1432adbac2120ef5c59d718f1cd48ef5fc920d3d1231ba32390c700465f3a5'
            'd2a48692549d426e9dfa0fad9897dddf200b7b82198d59e64819d419114a10d8')
validpgpkeys=()

#_ensure_local_nvm() {
    # let's be sure we are starting clean
#    which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
#    export NVM_DIR="${srcdir}/.nvm"

    # The init script returns 3 if version specified
    # in ./.nvrc is not (yet) installed in $NVM_DIR
    # but nvm itself still gets loaded ok
#    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
#}

#prepare() {
#    _ensure_local_nvm
#    nvm install 14
#}

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
#    _ensure_local_nvm
    export YARN_CACHE_FOLDER="${srcdir}/yarn_cache"
    yarn
    yarn run build:dir
}

package() {

    install -Dm 644 ${srcdir}/${_pkgname}-${pkgver}/release/linux-unpacked/resources/app.asar ${pkgdir}/usr/lib/${pkgname}/app.asar
    install -Dm 755 ${srcdir}/${_pkgname}-${pkgver}/release/linux-unpacked/resources/engine/aria2c ${pkgdir}/usr/lib/${pkgname}/engine/aria2c
    install -Dm 644 ${srcdir}/${_pkgname}-${pkgver}/release/linux-unpacked/resources/engine/aria2.conf ${pkgdir}/usr/lib/${pkgname}/engine/aria2.conf

    # binary wrapper
    install -Dm 775 ${srcdir}/motrix ${pkgdir}/usr/bin/${pkgname}

    # desktop enrty
    install -Dm 644 ${srcdir}/motrix.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop

    # icons
    install -Dm 644 ${srcdir}/${_pkgname}-${pkgver}/build/256x256.png ${pkgdir}/usr/share/icons/${pkgname}.png
}
