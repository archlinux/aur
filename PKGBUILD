# Maintainer: Sam S <smls75@gmail.com>
# Contributor: Daniel Wallace < danielwallace at gtmanfred dot com>

pkgname=bastion
pkgver=20120621
_hibver=2012-06-20
pkgrel=7
pkgdesc="An action role-playing game set in a lush imaginative world (Humble Bundle/Store version)"
url="http://www.supergiantgames.com/games/bastion/"
license=('custom')
arch=('i686' 'x86_64')
groups=("hib5" "hib9")
depends=('libxft')
makedepends=('curl')
install=$pkgname.install
PKGEXT=".pkg.tar"

_gamepkg="Bastion-HIB-${_hibver}.sh"

source=("hib://$_gamepkg"
        "$pkgname.desktop" 
        "mesa$pkgname" 
        "$pkgname.install")
md5sums=('aa6ccaead3b4b8a5fbd156f4019e8c8b'
         '0facce79c6d93c5914a58e096eca8c92'
         'a42e39c5f52abf19b6975cb79f732907'
         '234862600b3d8792b95eedeae28577b7')

case $CARCH in
    i686) _arch=x86 ;;
    x86_64) _arch=x86_64;;
esac

package() {
    cd "$srcdir"
    [[ -d "$srcdir"/"$pkgname-$_hibver" ]] && rm -r "$srcdir"/"$pkgname-$_hibver"
    sh $_gamepkg -u --packager pacman --nox11 --target "$srcdir"/"$pkgname-$_hibver" --bindir "$pkgdir"/opt/games/Bastion --datadir "$pkgdir"/opt/games

	find "${pkgdir}" -type f -exec chmod 644 "{}" +
	install -Dm644 "${pkgname}".desktop "${pkgdir}"/usr/share/applications/"${pkgname}".desktop
	install -Dm755 "mesa${pkgname}" "${pkgdir}"/usr/bin/"${pkgname}"mesa
	install -Dm644 "${pkgdir}"/opt/games/Bastion/Bastion.png "${pkgdir}"/usr/share/icons/"${pkgname}".png

	chmod 755 "${pkgdir}"/opt/games/Bastion/Bastion.bin."$_arch"
	ln -s "/opt/games/Bastion/Bastion.bin.$_arch" "${pkgdir}"/usr/bin/"${pkgname}"
}
