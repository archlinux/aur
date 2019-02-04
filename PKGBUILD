# Maintainer: Tucker Boniface <tucker@boniface.tech>
# Contributor:  Tejuswi Vaghjee <tejvghj at gmail dot com>
# Contributor: Sven-Hendrik Haase <sh at lutzhaase dot com>
# Contributor: Jaroslaw Swierczynski <swiergot at aur dot archlinux dot org>
# Contributor: Roman Kyrylych <Roman dot Kyrylych at gmail dot com>
# Contributor: Rabyte <rabyte at gmail dot com>

pkgname=actionfps
pkgver=2.0.0_M3
pkgrel=1
epoch=1
pkgdesc="A game based on the open-source AssaultCube first-person shooter (FPS)"
arch=('i686' 'x86_64')
url="https://actionfps.com"
license=('ZLIB' 'custom')
depends=('sdl' 'sdl_mixer' 'sdl_image' 'openal' 'zlib' 'gcc-libs' 'libgl' 'glu' 'curl')
makedepends=('mesa' 'clang')
source=("https://github.com/ActionFPS/ActionFPS-Game/releases/download/${pkgver//_/-}/ActionFPS.tar.bz2"
        'https://raw.githubusercontent.com/ActionFPS/ActionFPS-Game/master/docs/package_copyrights.txt'
        'actionfps-cubedir.patch'
        'actionfps'
        'actionfps-server'
        'actionfps.desktop'
        'actionfps.png')
sha512sums=('352d7805c321a621200e6c50de289dfb81a81c516df9fc8656f5b0ea26684d56a87da843a61d1e52cdea4e48c6b962adb0dd9fad6e259cadf75c1121a22b75f6'
            '44d9a06c48fa98c80873c3aaa3c3639ad5ce2251c8ab606178e8b8295af518df314e936f24e0ebd5796466044591477d323026e17ce43cdd53207552b5d45872'
            '0a337b67b6b8ec4d22a9b74c71f4f196b52c5a9e6d5f6fd1616efb8c99158839aed8aaf22268df3db84aeaa1a5254240102136a48e7f8511fd96416c12abb356'
            '9b2c802657d0d4cc25be98eb72c7d6a396c7a1abf5e5d6640849eb43db845bde0c4bac7c21edfefea526594faef805a4e1d218c0454191e6ff0f4a93d12a6187'
            '9a480f56053155fd51a5574ab4cf6a8d31479c35ba8ce5523e561d021f8d4198a505e2340572cd0f6e6d6c9deb99aaec5025518f366b5db7671f337018a11437'
            '751376e2820a3a5d590f4f323e414d5a40b34137ce9988a9dfe9aa857ba00ec3d721c323be7497e7d3f5002de0746c3af02f557029977247d0e72b16bdb6cbb8'
            '30b0e533939831f90695641632b70dbdd3adbab09fb89af24d8eb1fed7056942124775c1f8b2bb22b852800eb6d9749ed54b5fb6661c283ea590b519acbd1975')
prepare() {
    cd "$srcdir/ActionFPS"
    ./install-packages.sh
}

package() {
    cd "$srcdir"
    install -m755 -d "$pkgdir/usr/share/actionfps"
    cp -r ActionFPS/* "$pkgdir/usr/share/actionfps"
    install -Dm644 actionfps.png ${pkgdir}/usr/share/pixmaps/actionfps.png
    install -Dm644 actionfps.desktop ${pkgdir}/usr/share/applications/actionfps.desktop
    install -Dm644 package_copyrights.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    install -Dm755 actionfps ${pkgdir}/usr/bin/actionfps
    install -Dm755 actionfps-server ${pkgdir}/usr/bin/actionfps-server
}
