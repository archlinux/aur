# Maintainer:
# Contributor: 😂👌

pkgname=ttf-droid-emojiless
pkgver=20121017
pkgrel=4
pkgdesc="Derivate of Droid Fonts without characters listed as emoji, in order not to override color fonts"
arch=('any')
license=('Apache')
url='http://www.droidfonts.com/'
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
makedepends=('fontforge')
provides=('ttf-font' 'ttf-droid')
conflicts=('ttf-droid')
install=$pkgname.install
source=('https://sources.archlinux.org/other/community/ttf-droid/ttf-droid-20121017.tar.xz' 'serif-fontconfig.conf' 'sans-fontconfig.conf' 'sans-mono-fontconfig.conf' 'kufi-fontconfig.conf' 'https://github.com/iamcal/emoji-data/raw/master/emoji.json' 'cleaner.py' )

prepare() {
        ttfdir=$srcdir/google-droid-fonts-$pkgver
        for ttf in $ttfdir/*.ttf; do
                fontforge -script cleaner.py $ttf
        done
}

package()
{
        # Install fonts
        cd $srcdir/google-droid-fonts-$pkgver
        install -d $pkgdir/usr/share/fonts/TTF/ 
        install -m644 *.ttf $pkgdir/usr/share/fonts/TTF/ 

        # Install fontconfig
        cd $srcdir
        install -d $pkgdir/etc/fonts/conf.avail/
        install -m644 sans-fontconfig.conf $pkgdir/etc/fonts/conf.avail/65-$pkgname-sans-fontconfig.conf
        install -m644 sans-mono-fontconfig.conf $pkgdir/etc/fonts/conf.avail/60-$pkgname-sans-mono-fontconfig.conf
        install -m644 serif-fontconfig.conf $pkgdir/etc/fonts/conf.avail/65-$pkgname-serif-fontconfig.conf
        install -m644 kufi-fontconfig.conf $pkgdir/etc/fonts/conf.avail/65-$pkgname-kufi-fontconfig.conf
}

md5sums=('0fa20eb63d7d05b23be955777bb52a5d'
         '7db18cf9df70ee41fbab444c80117ec6'
         '61f59063f84bd1331a91e21ebf86d43d'
         '7d7787d92e7b5089558a6d68c99813e3'
         '954a340fc7cb2846826a97d2b752501d'
         'SKIP'
         '024d60d8fc5a214d2ca606fb1d3df686')
