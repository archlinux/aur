# Maintainer: Cloudef <mailroxas@gmail.com>
# Intelligent and suckless replacement for xdg-open

pkgname=linopen
pkgver=1.6
pkgrel=1
pkgdesc='Intelligent and suckless replacement for xdg-open'
arch=('any')
url='http://cloudef.eu'
license=('WTFPL')
backup=('etc/linopen.conf')
source=('open' 'linopen.conf')

# Set this 1 to symlink /usr/bin/open to /usr/bin/xdg-open
# and conflict with xdg-utils
PROVIDE_XDG_OPEN=1

if [ $PROVIDE_XDG_OPEN -eq 1 ]; then
   provides=('xdg-utils')
   conflicts=('xdg-utils')
fi

package() {
   install -Dm755 "$srcdir/open" "${pkgdir}/usr/bin/open"
   install -Dm644 "$srcdir/linopen.conf" "${pkgdir}/etc/linopen.conf"

   if [ $PROVIDE_XDG_OPEN -eq 1 ]; then
      ln -s "/usr/bin/open" "$pkgdir/usr/bin/xdg-open"
   fi
}

md5sums=('15a6b084258db3a5d15eda3e65295445'
         '37eef2ae627bb018b0638d6fefde7780')

# vim: set ts=8 sw=3 tw=0 :
