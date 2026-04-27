# Maintainer:  <sherit45@protonmail.com>
pkgname=man-pages-tr
pkgver=2.0.4
pkgrel=1
pkgdesc='A collection of Turkish translations of Linux manual pages'
arch=('any')
license=('GPL')
url='http://sourceforge.net/projects/belgeler/'
depends=('man-db')
makedepends=('sed')
source=("http://downloads.sourceforge.net/project/belgeler/manpages-tr/manpages-tr-${pkgver}/manpages-tr-${pkgver}.tar.gz")
md5sums=('3f5fed164ba9fd9e725117cf4150fad4')

package() {
  cd "$srcdir/manpages-tr-${pkgver}"

  mkdir -p "$pkgdir/usr/share/man/tr"
  cp -a source/man* "$pkgdir/usr/share/man/tr/"

  echo "==> a conflict scan is being performed..."
  
  find "$pkgdir" -type f | while read -r f; do
    
    local_path="${f#$pkgdir}"
    
    if pacman -Qo "$local_path" &>/dev/null || \
       pacman -Qo "${local_path}.gz" &>/dev/null || \
       pacman -Qo "${local_path}.zst" &>/dev/null; then
       
      echo "  -> it already exists in the system, it is being unpacked: $local_path"
      rm -f "$f"
    fi
  done
   find "$pkgdir" -type d -mindepth 1 -empty -delete
}
