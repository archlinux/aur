# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=gf_backup_tool-git
pkgver=20201003
pkgrel=1
pkgdesc="Backup Terminal tool based on rsync & systemd"
arch=('x86_64')
url="https://github.com/Gregory-F/gf_backup_tool"
license=('GPL')
depends=('systemd'
	'dateutils'
	'rsync'
	'bash'
	)
install=gf_backup_tool.install
makedepends=(git sudo)
checkdepends=()
backup=('etc/gf_backup_tool/config'
	'etc/gf_backup_tool/exclude_file')
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
  cd "${_pkgname}"
  date +%Y%m%d
}


#prepare() {
#	cd "$pkgname"
#}

#build() {
#	cd "$pkgname"
#	./configure --prefix=/usr
#	make
#}

#check() {
#	cd "$pkgname-$pkgver"
#	make -k check
#}

package() {
	for var in {Custom,Hourly,Dailly,Weekly,Mounthly}
	do
	    mkdir -p $pkgdir/snapshots/$var
        done
	pkgvar=gf_backup_tool
	#make PREFIX=/usr DESTDIR="$pkgdir/" install
	install -Dm 644 "$srcdir/$pkgvar/LICENSE" "$pkgdir/usr/share/licenses/gf_backup_tool/LICENSE"
	install -Dm 644 "$srcdir/$pkgvar/config" "$pkgdir/etc/gf_backup_tool/config" 
	install -Dm 644 "$srcdir/$pkgvar/exclude_file" "$pkgdir/etc/gf_backup_tool/exclude_file"
	install -Dm 645 "$srcdir/$pkgvar/backup_tool" "$pkgdir/usr/bin/backup_tool"
	install -Dm 644 "$srcdir/$pkgvar/gf_backup_tool.timer" "$pkgdir/etc/systemd/system/gf_backup_tool.timer"
	install -Dm 644 "$srcdir/$pkgvar/gf_backup_tool.service" "$pkgdir/etc/systemd/system/gf_backup_tool.service"

}

