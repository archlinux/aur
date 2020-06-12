# Maintainer: Ahmad Hasan Mubashshir <ahmubashshir@gmail.com>
pkgname=anbox-launchers-git
pkgver=r.7d9530f
pkgrel=1
pkgdesc="Add Anbox App Launchers to Anbox Category in Desktop Menu."
arch=('any')
url="https://github.com/ahmubashshir/anbox-launchers"
license=('GPL')
groups=()
depends=('anbox-git'
		 'systemd'
		 'python-xdg')
makedepends=('coreutils')
provides=('anbox-launchers')
conflicts=('anbox-launchers')
install=anbox-launchers.install
source=("git+https://github.com/ahmubashshir/anbox-launchers.git")
validpgpkeys=('916961EE198832DD70B628B356DB0538F60D951C')
md5sums=('SKIP')
pkgver()
{
  cd "$srcdir/${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
  pkgrel=$(git diff --shortstat|cut -d' ' -f2)
}
package() {
   cd "$srcdir/${pkgname%-git}"
   make DESTDIR="$pkgdir" SYSCONFDIR=/etc install
}
