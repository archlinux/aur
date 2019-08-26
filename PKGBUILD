# Maintianer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Brian Bidulock <bidulock@openss7.org>
# Contributor: Adrian C. <anrxc..sysphere.org>

pkgname=vicious-git
_pkgname=vicious
pkgver=2.3.3.r0.gea0c5a4
pkgrel=1
pkgdesc='Widgets for the Awesome window manager'
arch=('any')
url='https://github.com/vicious-widgets/vicious'
license=('GPL2')
depends=('lua')
makedepends=('git')
optdepends=('hddtemp: for the HDD Temp widget type'
            'alsa-utils: for the Volume widget type'
            'wireless_tools: for the Wireless widget type'
            'curl: for widget types accessing network resources')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname::git+https://github.com/vicious-widgets/$_pkgname".git)
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package () {
  cd "$pkgname"
  # Install the vicious library
  install -dm755 "$pkgdir"/usr/share/lua/5.3/"$pkgname"/{widgets,contrib}
  install -m644 *.lua "$pkgdir/usr/share/lua/5.3/$pkgname"
  install -m644 widgets/*.lua "$pkgdir/usr/share/lua/5.3/$pkgname/widgets"
  install -m644 contrib/*.lua "$pkgdir/usr/share/lua/5.3/$pkgname/contrib"
}

# vim:set ts=2 sw=2 et:
