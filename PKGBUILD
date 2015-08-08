# Maintainer: flying sheep <flying-sheep@web.de>
# Contributor: N30N <archlinux@alunamation.com>
# Contributor: swiftgeek <swiftgeek@gmail.com>
# Contributor: Marvn <mistrmarvn@gmail.com>
# Contributor: fzerorubigd <fzerorubigd@gmail.com>

pkgname=shank2
pkgver=update7
pkgrel=4
pkgdesc='A 2D side-scrolling beat ’em up.'
url='http://www.shankgame.com/'
license=('custom:commercial')
arch=('i686' 'x86_64')
groups=('humble-indie-bundle7' 'games')
depends=('sdl' 'libgl')
source=("hib://shank2-linux-$pkgver.tgz" "shank2.sh" "shank2.desktop")
sha1sums=('246df822375a97ab4e3a74353b5a33e9b4a54934'
          'b6ce1311e04c65243ee2159f877fba539121887e'
          '6a2267ea66fce90dea94ff3964ab704751f18ee5')
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')
PKGEXT='.pkg.tar'

package() {
	cd "$srcdir"
	
	if [ $CARCH == 'x86_64' ]; then
		_arch=64
	else
		_arch=32
	fi
	
	_install_dir="$pkgdir/opt/shank2"
	
	install -Dm755 shank2.sh      "$pkgdir/usr/bin/shank2"
	install -Dm644 shank2.desktop "$pkgdir/usr/share/applications/shank2.desktop"
	
	install -Dm755 bin/shank2-bin$_arch "$_install_dir/bin/shank2"
	install -Dm644 Shank2.xpm           "$_install_dir/Shank2.xpm"
	install -dm755                      "$_install_dir/lib"
	install  -m644 bin/lib$_arch/*      "$_install_dir/lib"
	find data{,-pc} -type f -exec install -Dm644 {} "$_install_dir/{}" \;
}
