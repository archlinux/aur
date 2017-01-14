#Maintainer issue <issue at archlinux dot info>

pkgname=ntrviewer-git
_pkgname=NTRViewer
pkgdesc=" PC Viewer for NTR CFW's streaming feature"
url="https://github.com/44670/NTRViewer"
pkgrel=1
depends=('sdl' 'libjpeg-turbo' 'ffmpeg')
makedepends=('git' 'make')
arch=('x86_64')
license=('GPLv2')
md5sums=('SKIP'
         '302594045b78df63fbc3c6e798318c5c')
pkgver=r23.4af3190
source=('git+https://github.com/44670/NTRViewer.git' 'ntrviewer.patch')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$_pkgname"
    patch -Np1 -i "${srcdir}/ntrviewer.patch"
}

build(){
    cd $_pkgname

    make CONF=Release
}

package(){
    install -Dm755 "$srcdir/$_pkgname/dist/Release/GNU-Linux/ntrviewer" "$pkgdir/usr/bin/ntrviewer"
}

