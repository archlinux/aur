# Maintainer: Toby Jones <quoth.the.server@gmail.com>
# This PKGBUILD will grab the development version of Etterna - if you want the stable version, uncomment the line in build()

pkgname=etterna-git
pkgver=0.61.1
pkgrel=1
pkgdesc="Etterna: an advanced cross-platform rhythm game focused on keyboard play"
arch=('i686' 'x86_64')
url="https://etternaonline.com"
license=('MIT')
provides_i686=('etterna')
conflicts_i686=('etterna')
provides_x86_64=('etterna')
conflicts_x86_64=('etterna')
depends_i686=(libmad gtk2 glu curl libpulse)
depends_x86_64=(libmad gtk2 glu curl libpulse)
optdepends_i686=('jack: Audio server')
optdepends_x86_64=('jack: Audio server')
source_i686=('git+https://github.com/etternagame/etterna')
source_x86_64=('git+https://github.com/etternagame/etterna')
sha512sums_i686=('SKIP')
sha512sums_x86_64=('SKIP')
install=etterna-git.install

pkgver() {
    curl --silent https://api.github.com/repos/etternagame/etterna/releases/latest | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/' | sed 's/^v\(.*\)/\1/'
}

build() {
    cd "etterna"

    # UNCOMMENT THE BELOW LINE FOR STABLE ETTERNA 
    # git checkout v$(pkgver)
    git submodule update --init

    mkdir "build"
    cd "build"
    cmake -G 'Unix Makefiles' ..

    make
}

package() {
    mkdir -p "$pkgdir/usr/share/applications"
    mkdir -p "$pkgdir/opt/etterna-git"
    mkdir -p "$pkgdir/usr/share/licenses/etterna-git"

    cp "$srcdir/etterna/etterna" "$pkgdir/opt/etterna-git/"
    cp "$srcdir/etterna/GtkModule.so" "$pkgdir/opt/etterna-git"

    mkdir "$pkgdir/opt/etterna-git/Songs"
    
    cp -R "$srcdir/etterna/Assets/" "$pkgdir/opt/etterna-git"
    cp -R "$srcdir/etterna/BackgroundEffects/" "$pkgdir/opt/etterna-git"
    cp -R "$srcdir/etterna/Cache/" "$pkgdir/opt/etterna-git"
    cp -R "$srcdir/etterna/Characters/" "$pkgdir/opt/etterna-git"
    cp -R "$srcdir/etterna/Data/" "$pkgdir/opt/etterna-git"
    cp -R "$srcdir/etterna/Logs/" "$pkgdir/opt/etterna-git"
    cp -R "$srcdir/etterna/NoteSkins/" "$pkgdir/opt/etterna-git"
    cp -R "$srcdir/etterna/Scripts/" "$pkgdir/opt/etterna-git"
    cp -R "$srcdir/etterna/Songs/" "$pkgdir/opt/etterna-git"
    cp -R "$srcdir/etterna/Themes/" "$pkgdir/opt/etterna-git"

    cp "../etterna.desktop" "$pkgdir/usr/share/applications"
    cp "../LICENSE" "$pkgdir/usr/share/licenses/etterna-git"
}
