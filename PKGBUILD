# Maintainer: robertfoster

pkgname=assaultcube-reloaded
pkgver=2.7
pkgrel=1
pkgdesc='AssaultCube Reloaded'
arch=('i686' 'x86_64')
url='http://acr.victorz.ca'
license=('ZLIB')
depends=('curl' 'gcc-libs' 'libgl' 'libvorbis' 'libx11' 'openal' 'sdl' 'sdl_image' 'zlib')
source=("https://github.com/actf/acr/archive/v${pkgver}.tar.gz"
    'acreloaded'
    'acreloaded-server'
    'acreloaded.desktop'
    'acreloaded.svg'
)

package() {
    install -d "${pkgdir}"/usr/bin
    install -d "${pkgdir}"/usr/share/acreloaded
    cd ${srcdir}/acr-${pkgver}
    cd  source/src

    make DESTDIR=$pkgdir install
    cd ../..

    cp -rf bot config packages acr/packages ${pkgdir}/usr/share/acreloaded

    install -Dm755 bin_unix/native_client ${pkgdir}/usr/share/acreloaded/native_client
    install -Dm755 bin_unix/native_server ${pkgdir}/usr/share/acreloaded/native_server
    install -Dm644 ${srcdir}/acreloaded.svg ${pkgdir}/usr/share/pixmaps/acreloaded.svg
    install -Dm644 ${srcdir}/acreloaded.desktop ${pkgdir}/usr/share/applications/acreloaded.desktop
    install -Dm755 ${srcdir}/acreloaded ${pkgdir}/usr/bin/acreloaded
    install -Dm755 ${srcdir}/acreloaded-server ${pkgdir}/usr/bin/acreloaded-server
}

md5sums=('8ef9f42706153f4d60a918a0f892d811'
    'c6db5816ce66282f6d6c7d08792b6095'
    '53b17712afb7f0a5646b9894032d06ff'
    'bff621e554812c7325b2bd7f56e9e881'
'3b142417157d73da4a7981fd07bcb628')
