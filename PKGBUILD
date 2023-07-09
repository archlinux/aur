# Maintainer: syntheit <daniel@matv.io>

_pkgname=rigsofrods
_gitname=rigs-of-rods

pkgname=rigsofrods
pkgver=2022.12
pkgrel=1
pkgdesc="An open source vehicle simulator based on soft-body physics"
arch=('i686' 'x86_64')
url="https://rigsofrods.org"
license=('GPL')
depends=('boost>=1.50' 'curl' 'openssl' 'gtk2' 'mygui>=3.2.2' 'ogre' 'ois>=1.3' 'openal' 'rapidjson>=1.1.0')
optdepends=('angelscript' 'caelum>=0.6.2' 'nvidia-cg-toolkit')
makedepends=('gcc' 'cmake>=2.8' 'git' 'conan')
conflicts=('rigsofrods-git' 'rigsofrods-hg' 'rigsofrods-bin')
source=("https://github.com/RigsOfRods/rigs-of-rods/archive/${pkgver}.tar.gz"
    "plugins.cfg"
    "rigsofrods.png"
    "RoRConfig.desktop"
"RoR.desktop")
sha512sums=('29d754c2f680ede181c40b4f4c88b471a9b909c362c29410d61ff43db6e0cdf0625971cd90da64305604909eaf9162da37f711a242f3fbb6fb2097abe14e73a6'
            '1fffff3e1e1bcf55fb2604c3874457571151082c09e5bcbccf452d6d60b01f2fff825fab601bf428196310c97d67ea1b9346f6de6b17a9906024f867aaa2ceb4'
            '8280ddec6dba37e66c323e469c1894bacc3b592b6ea1f7fd3876bc9e7253b14b4949c3c51d7dd47ad7bd78e085fbe51aad83b1e8d0b0755deda426129e4a6710'
            '40a000061d72245265d53d7c2ce0c4acc81eb3dddb6f6beda4b693a154e34922b8eb5c8400062b58c5f43a74be6cdaab938c1cd6427aebfc691d1fa52517fe2d'
            'b0c04df93fa622d27ba485df1253ee786ebe42acb2c7b2f5d9657f22623503ee995845905f782c7b550625a4db0dbfdd924e4757b2daf21f84bb9cb3f6d683af')

build() {
    cd "$srcdir/$_gitname-$pkgver"
    
    # get a clean build dir
    [[ -d build ]] && rm -rf build
    mkdir build && cd build
    cmake -GNinja -DCMAKE_BUILD_TYPE=Release ..
    ninja
}

package() {
    mkdir -p "$pkgdir/opt/$_pkgname"
    cp -r $srcdir/$_gitname-$pkgver/bin/* "$pkgdir/opt/$_pkgname/"
    
    install -Dm755 rigsofrods.png "$pkgdir/usr/share/pixmaps/rigsofrods.png"
    install -Dm755 RoR.desktop "$pkgdir/usr/share/applications/RoR.desktop"
    install -Dm755 RoRConfig.desktop "$pkgdir/usr/share/applications/RoRConfig.desktop"
    install -Dm755 plugins.cfg "$pkgdir/opt/$_pkgname/plugins.cfg"
}
