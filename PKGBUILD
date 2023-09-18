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
makedepends=('gcc' 'cmake>=2.8' 'ninja' 'git' 'conan')
conflicts=('rigsofrods-git' 'rigsofrods-hg' 'rigsofrods-bin')
source=("https://github.com/RigsOfRods/rigs-of-rods/archive/${pkgver}.tar.gz"
	"plugins.cfg"
	"rigsofrods.png"
	"RoRConfig.desktop"
	"RoR.desktop")
sha256sums=('d4fc9ec2f7e9154e21ec79d39201c5bb3823e5f2fdf641f99c612ef69275ba90'
            '6bf5a1a890047b93b551a1a48dac3bf66089416b2a2db93e3d62c09db97760d4'
            'aef6a25da69bc8b5b06160d402a612255a3ba0f653115873a3f7eb7b33964c73'
            '48fb1bae34a02baca5d93789efe50d51b55533f5f513910f87adcd38accc8271'
            'c6b0bfd1f282da88f7b581ec8bc877ba9d45cf5968be389b5fe2119ff2377cf7')

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
