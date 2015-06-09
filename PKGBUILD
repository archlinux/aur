# Maintainer:  Eugen Zagorodniy <https://github.com/ezag>
# Contributor: Travis Raines <rainest@carleton.edu>
# Contributor: Vesa Kaihlavirta <vegai@iki.fi>
# Contributor: Kristoffer Fossgård <kfs1@online.no>

pkgname=terminus-cyrillic
pkgver=4.39
pkgrel=1
pkgdesc="Terminus font with dv1 and ij1 patches applied"
depends=(xorg-fonts-encodings xorg-fonts-alias xorg-font-utils fontconfig)
replaces=(xserver-terminus-fonts)
conflicts=(terminus-font)
arch=(any)
source=("http://downloads.sourceforge.net/project/terminus-font/terminus-font-${pkgver}/terminus-font-${pkgver}.tar.gz")
url="http://sourceforge.net/projects/terminus-font/"
install=terminus-cyrillic.install
license=('GPL-2' 'OFL')

package() { 
  cd $srcdir/terminus-font-$pkgver

  # Uncomment patches you need:
  #
  # ao2 - round ('o'-like) cyrillic 'a'
  # dv1 - printing cyrillic 'de' and 've' (default is handwritten)
  # ge2 - handwritten cyrillic 'ge' (default is printing)
  # gq2 - grave accent and apostrophe as opening and closing single quotes
  # hi2 - higher upper case letters, digits etc.
  # ij1 - printing cyrillic 'i' and 'short i' (default is handwritten)
  # ka2 - high cyrillic 'ka' (looks as latin 'k')
  # ll2 - more distinctive latin 'l'
  # td1 - centered ascii tidle
  
  # patch -i alt/ao2.diff
  patch -i alt/dv1.diff
  # patch -i alt/ge2.diff
  # patch -i alt/gq2.diff
  # patch -i alt/hi2.diff
  # patch -i alt/hi2-dv1.diff
  # patch -i alt/hi2-ka2.diff
  patch -i alt/ij1.diff
  # patch -i alt/ka2.diff
  # patch -i alt/ll2.diff
  # patch -i alt/td1.diff

  chmod +x configure
  ./configure --prefix=/usr --x11dir=/usr/share/fonts/local/ --psfdir=/usr/share/kbd/consolefonts/
  make DESTDIR=$pkgdir install
}
md5sums=('1ec1bee67a1c017f349bc8558b2d4fa6')
