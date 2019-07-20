# Maintainer: Aaron Esau <game@aaronesau.com>
pkgname="game-git"
pkgver="1.0"
pkgrel="1"
arch=("i686" "x86_64")
md5sums=("SKIP")
url="https://github.com/Arinerron/Game"
pkgdesc="a game without a name"
source=("${pkgname}-${pkgver}::git+https://github.com/Arinerron/Game.git#branch=master")
depends=("jdk-openjdk" "jre-openjdk")

rinstall() {
    if [ -f "$1" ]; then
        install -D "$1" "$2/" "$3" "$4"
        return 0
    fi

    for file in $(find "$1" -type f -printf '%P\n'); do
        install -D "$1/$file" "$2/$file" "$3" "$4"
    done

    return 0
}

prepare() {
    # pre_build

    cd "${srcdir}/${pkgname}-${pkgver}"
    
}

build() {
    # build

    cd "${srcdir}/${pkgname}-${pkgver}"
    sh compile.sh
}

check() {
    # post_build

    cd "${srcdir}/${pkgname}-${pkgver}"
    
}

package() {
    # "movements"
    # ensure target directories exist
    mkdir -p "$pkgdir//usr/share/game"
    mkdir -p "$pkgdir//usr/bin/"
    
    # copy files over and change perms
    rinstall "${srcdir}/${pkgname}-${pkgver}/." "${pkgdir}//usr/share/game" --mode=755 --owner="root" --group="root"
    rinstall "${srcdir}/${pkgname}-${pkgver}/game" "${pkgdir}//usr/bin/" --mode=755 --owner="root" --group="root"
}
