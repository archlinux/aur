# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
pkgname=orpheus-git
_pkgname="${pkgname%-git}"
pkgver=0.1.r7.gcf448df
pkgrel=2
pkgdesc="Wrapper for modified version of Impacket GetUserSPNs.py and kerberosv5.py which alters the KDC Options (Ticket Options) and the Encryption Type for Kerberoasting."
arch=('any')
url="https://github.com/trustedsec/orpheus"
license=(custom)
depends=('python'
         'impacket')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-bin")
source=("git+$url")
sha512sums=('SKIP')

# https://wiki.archlinux.org/title/VCS_package_guidelines
pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  install -Dm644 -t "$pkgdir/opt/$_pkgname" $_pkgname/README.md
  install -Dm755 "$srcdir/$_pkgname/$_pkgname.py" "$pkgdir/opt/$_pkgname/$_pkgname.py"
  install -Dm755 "$srcdir/$_pkgname/GetUserSPNs.py" "$pkgdir/opt/$_pkgname/GetUserSPNs.py"
  install -Dm755 "$srcdir/$_pkgname/kerberosv5.py" "$pkgdir/opt/$_pkgname/kerberosv5.py"

  install -d "$pkgdir/usr/bin"
  ln -s /opt/$_pkgname/$_pkgname.py "${pkgdir}/usr/bin"
}

