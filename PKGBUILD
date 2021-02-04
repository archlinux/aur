# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Tucker Boniface <tucker@boniface.tech>
# Contributor: Tejuswi Vaghjee <tejvghj at gmail dot com>
# Contributor: Sven-Hendrik Haase <sh at lutzhaase dot com>
# Contributor: Jaroslaw Swierczynski <swiergot at aur dot archlinux dot org>
# Contributor: Roman Kyrylych <Roman dot Kyrylych at gmail dot com>
# Contributor: Rabyte <rabyte at gmail dot com>

pkgname=actionfps
pkgver=1.2.0.2
pkgrel=1
pkgdesc="A game based on the open-source AssaultCube first-person shooter (FPS)"
arch=('i686' 'x86_64')
url="https://actionfps.com"
license=('ZLIB' 'custom')
depends=('sdl' 'sdl_mixer' 'sdl_image' 'openal' 'zlib' 'gcc-libs' 'libgl' 'glu' 'curl' 'libogg' 'libvorbis')
makedepends=('mesa' 'clang')
source=("https://github.com/assaultcube/AC/releases/download/v${pkgver}/AssaultCube_v${pkgver}.tar.bz2"
        'actionfps-cubedir.patch'
        'actionfps'
        'actionfps-server'
        'actionfps.desktop'
        'actionfps.png')
sha512sums=('50b7b466968ab7570889cc6c4d13b221cc8c5c0d24255f42aa4d0eafb92e186b1b4fb737308691fcb786d07cbfb74622b73967e42a96278e710796790c469ac3'
            '4dae912c01aa50953e3859bacb8ba57c09e0ba22c54eebcc2a6df9223cdba2b14fd2337842ed40ad1850cf8cd380b4a0453dc00d16f83fc145dcc22408429cbf'
            '6124c36968521f395aa43d1e01d0e7f939259b650a24bf639b18bb2adaa329309d14c25ad66e747274ba18e07f5c7d29a95b72f4922565a4ee36a1de61381ff6'
            '621c919fdc766eac79cfaeee11ddb402a02901fad33f27ccdb2bd7404e376092e195fca4a26b82cb21bede8fe7ccf229936123bb5a945d3f89eab9aa3b9bf2af'
            '751376e2820a3a5d590f4f323e414d5a40b34137ce9988a9dfe9aa857ba00ec3d721c323be7497e7d3f5002de0746c3af02f557029977247d0e72b16bdb6cbb8'
            '30b0e533939831f90695641632b70dbdd3adbab09fb89af24d8eb1fed7056942124775c1f8b2bb22b852800eb6d9749ed54b5fb6661c283ea590b519acbd1975')
            
prepare() {
    cd "AssaultCube_v${pkgver}"
    rm -rf "source/lib"
    patch -uN < "../actionfps-cubedir.patch"
    cd "source/src"
    make
}

package() {
    install -m755 -d "$pkgdir/usr/share/games/actionfps"
    cp -r "AssaultCube_v${pkgver}"/* "$pkgdir/usr/share/games/actionfps"
    install -Dm644 actionfps.png "${pkgdir}/usr/share/pixmaps/actionfps.png"
    install -Dm644 actionfps.desktop "${pkgdir}/usr/share/applications/actionfps.desktop"
    install -Dm644 "AssaultCube_v${pkgver}/docs/package_copyrights.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 actionfps "${pkgdir}/usr/bin/actionfps"
    install -Dm755 actionfps-server "${pkgdir}/usr/bin/actionfps-server"
}
