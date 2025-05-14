# Maintainer: Sid <sidpranjale127@protonmail.com>
# Continuing the work of:
# Maintainer: Jan Cholasta <jan at cholasta net>

pkgname=nblood-git
pkgver=r14041.6c3f8e754
pkgrel=1
pkgdesc='Blood port based on EDuke32 (git version)'
arch=('i686' 'x86_64' 'aarch64')
url='http://nukeykt.retrohost.net/'
license=('GPL' 'custom:BUILD')
depends=('flac'
         'glu'
         'gtk2'
         'libgl'
         'libogg'
         'libvorbis'
         'libvpx'
         'sdl2'
         'timidity++')
makedepends=('git' 'imagemagick')
makedepends_i686=('nasm')
optdepends=('blood-demo')
provides=('nblood')
conflicts=('nblood')
source=('git+https://github.com/nukeykt/NBlood.git'
        'nblood.png'
        'nblood.desktop')
sha256sums=('SKIP'
            '8061b8ca92b0acab82c2c79e5da71b8d0acb82502c7c96e9ef86b09cfcd83da5'
            '58807697e95e071a6354f87e8e2fdae9f32af0e08dad1a510a0089845df42184')

pkgver() {
    cd $srcdir/NBlood
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    cd NBlood
    make blood
}

package() {
    cd NBlood
    install -D -t "$pkgdir"/usr/bin nblood
    install -D -t "$pkgdir"/usr/share/games/nblood -m 644 nblood.pk3
    install -D -t "$pkgdir"/usr/share/licenses/$pkgname -m 644 package/common/buildlic.txt
    install -Dm644 "$srcdir"/nblood.png "$pkgdir"/usr/share/pixmaps/nblood.png
    install -D -t "$pkgdir"/usr/share/applications -m 644 "$srcdir"/nblood.desktop
    echo "Place your game files in ~/.config/nblood"
}
