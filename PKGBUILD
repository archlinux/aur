pkgname=aquaria-hib
pkgver=1.1.3
pkgrel=3
pkgdesc="A 2D fantasy underwater action-adventure game (Humble Bundle version)"
arch=('i686' 'x86_64')
[[ $CARCH = "i686" ]] && _arch='i386' || _arch='amd64'
url="http://www.bit-blot.com/"
license=('custom:commercial')
provides=('aquaria-1.1.3')
conflicts=('aquaria' 'aquaria-data-hib' 'aquaria-git')
replaces=('aquaria' 'aquaria-data-hib' 'aquaria-git')
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')

PKGEXT='.pkg.tar'

source=("hib://aquaria_${pkgver}_$_arch.deb"
	"aquaria.desktop")
[[ $CARCH = "i686" ]] && sha512sums=('017a06f2bc4ca50d191b20e27b1cbdb49658e03fbcb7e18e731832c4b528d63bffd88c1d1953b2c8513f9c351a5ea1e736187d735554dfc6e6f7d25917b9a606') || sha512sums=('c7f0cb4eacef6804d57a93dd572be3b18c8aa78953d66f14e625e19d39e25d85b777157db79bccbbeabb9a7dc655f1ff43f6cbd287a5c4a89e1eb2e6b4ee219a')
sha512sums+=('9c647f9452995d7ed78511ba80ecd0f656bbe33992116096a54d8e67ac7f54e919ac151662485ed7363e7834b3535cc76e9a376e78c058205d94ad75f831af05')

package() {
	mkdir $srcdir/data
	tar -C $srcdir/data -xzf data.tar.gz
	pushd $srcdir/data
	find -type f -path "./opt*" -exec install -Dm755 '{}' $pkgdir/'{}' \;
	popd
	mv $pkgdir/opt/Aquaria $pkgdir/opt/aquaria
	mkdir -p $pkgdir/usr/bin
	ln -s /opt/aquaria/aquaria $pkgdir/usr/bin/aquaria
	install -Dm644 $srcdir/aquaria.desktop $pkgdir/usr/share/applications/aquaria.desktop
}
