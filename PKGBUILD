# Maintainer: Aaron Esau <pfc@aaronesau.com>
pkgname="pfc-git"
pkgver="1.0"
pkgrel="1"
arch=("i686" "x86_64")
md5sums=("SKIP")
url="https://github.com/Arinerron/pfc"
pkgdesc="a cli-based modular toolkit for pentesting and reconnaissance"
source=("${pkgname}-${pkgver}::git+https://github.com/Arinerron/pfc.git#branch=master")
depends=("jdk8-openjdk" "jre8-openjdk")

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
    mkdir -p "$pkgdir//usr/share/pfc"
    mkdir -p "$pkgdir//usr/bin/"
    
    # copy files over and change perms
    rinstall "${srcdir}/${pkgname}-${pkgver}/." "${pkgdir}//usr/share/pfc" --mode=755 --owner="root" --group="root"
    rinstall "${srcdir}/${pkgname}-${pkgver}/pfc" "${pkgdir}//usr/bin/" --mode=755 --owner="root" --group="root"
}
