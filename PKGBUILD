# Maintainer: Gregory-F <guegre1979@netcourrier.com>
pkgname=gf_backup_tool-git
pkgver=1.0.6.5bb5432
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
makedepends=(git)
checkdepends=()
backup=('etc/gf_backup_tool/config'
	'etc/gf_backup_tool/exclude_file')
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
  cd "${_pkgname}"
  printf "1.0.%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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

