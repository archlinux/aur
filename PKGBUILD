# Maintainer: wenLiangcan <boxeed at gmail dot com>

pkgname=monodevelop-emmetplugin
_pkgname=MonoDevelop.EmmetPlugin
pkgver=20140115
pkgrel=1
pkgdesc="This is an attempt to create emmet plugin for Monodevelop."
arch=('i686' 'x86_64')
url="https://github.com/SHTrassEr/MonoDevelop.EmmetPlugin"
license=('Other')
depends=('nodejs' 'monodevelop' 'mono-addins')
source=('git://github.com/SHTrassEr/MonoDevelop.EmmetPlugin.git')
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git log -1 --format='%cd' --date=short | tr -d -- '-'
}


build() {
    export MONO_SHARED_DIR="${startdir}/src/.wabi"
    mkdir -p "${MONO_SHARED_DIR}"

    cd "${srcdir}/${_pkgname}"

    ./configure.sh
    LD_PRELOAD="" make || return 1
}

package() {
    cd "${srcdir}/${_pkgname}"
    folder="${pkgdir}/usr/lib/monodevelop/AddIns/${_pkgname}"
    mkdir -p "${folder}"
    cp -r "bin/local/Debug/." "${folder}"
    chmod -R 755 "${folder}"
}
