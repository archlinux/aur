# Maintainer: Jake <oshaugh143@gmail.com>

pkgname='enum4linux-git'
pkgver='r44.1de6e86'
pkgrel=1
pkgdesc="A Linux alternative to enum.exe for enumerating data from Windows and Samba hosts"
arch=('x86_64')
url="https://labs.portcullis.co.uk/tools/enum4linux/"
license=('GPL')
depends=('perl' 'smbclient' 'polenum' 'openldap')
makedepends=('git' 'sed')
provides=('enum4linux')
conflicts=('enum4linux')
source=("$pkgname::git+https://github.com/CiscoCXSecurity/enum4linux.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$pkgname"
  sed -i 's|polenum.py|polenum|' enum4linux.pl
}

package() {
	cd "$pkgname"
	install -Dm755 enum4linux.pl "$pkgdir/usr/bin/enum4linux"
	install -Dm644 share-list.txt "$pkgdir/usr/share/enum4linux/share-list.txt"
}
