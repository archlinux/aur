# Maintainer: bobpaul <aurpackage [at] bobpaul 'period' org>
# This package is weird and needs some re-thinking
# Upstream wants to store the settings in the installation directory like an old MSDos program
# Instead I include a launcher script which uses a bunch of simlinks to run the game from
# ~/.config/onelife which ensures your settings stay in your home folder
#
# ... there's gotta be a better way
pkgname="onehouronelife-bin"
pkgver="58"
pkgrel=5
epoch=
pkgdesc="Binary package for One Hour One Life game by Jason Rohrer"
arch=('x86_64')
url="http://onehouronelife.com"
license=('custom:Public Domain')
groups=()
depends=("xclip" "lib32-sdl")
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=('onehouronelife-latest')
replaces=()
backup=()
options=()
install=
changelog=
_folder=OneLife_v${pkgver}
_tarname=${_folder}_Linux
source=(http://download$(( (RANDOM % 8) + 1)).onehouronelife.com/downloads/$_tarname.tar.gz)
#source=(git+https://github.com/jasonrohrer/OneLifeData7.git
#        git+https://github.com/jasonrohrer/minorGems.git
#        git+https://github.com/jasonrohrer/OneLife.git
#        )
noextract=()
sha256sums=('1099672b88ab7e4e801a22a24a36195e2f59a76345224cb7e9bd73c91cea99a9')
#sha256sums=( 'SKIP'
#             'SKIP'
#             'SKIP')
validpgpkeys=()

prepare() {
   cd $_folder
   rm -rf settings_default >/dev/null || true
   mv settings settings_default
}

#build() {
#}

#check() {
#	cd "$pkgname-$pkgver"
#	make -k check
#}

package() {
    instdir=${pkgname%-bin}
    install -dm755 $pkgdir/opt/$instdir
    cp -r $_folder/* $pkgdir/opt/$instdir/
    install -m755  $startdir/onelife $pkgdir/opt/$instdir
    install -dm755 $pkgdir/usr/local/bin
    ln -s /opt/$instdir/onelife $pkgdir/usr/local/bin/onelife
    ln -s /opt/$instdir/no_copyright.txt $pkgdir/opt/$instdir/LICENSE
}
