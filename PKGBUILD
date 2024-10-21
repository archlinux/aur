# Maintainer: Klimenko Maxim Sergievich <klimenkomaximsergievich@gmail.com>
# Contributor: Klimenko Maxim Sergievich <klimenkomaximsergievich@gmail.com>

pkgname=simple-stateful-firewall
pkgver=0.0.17
pkgrel=1
pkgdesc="Simple Stateful Firewall. For personal computers or you can change this by yourself"
arch=('i686' 'x86_64')
url="https://github.com/asciiscry3r/simple-stateful-firewall"
license=('GPL2')
depends=('iptables')
optdepends=('opensnitch: A GNU/Linux application firewall')
makedepends=('git')
source=("https://github.com/asciiscry3r/simple-stateful-firewall/archive/refs/tags/${pkgver}.tar.gz")
sha1sums=('SKIP')
conflicts=('simple-stateful-firewall')
provides=('simple-stateful-firewall')

package() {
    cd "${pkgname}-${pkgver}" || exit 1
    make DESTDIR="${pkgdir}" install
}

post_install() {

    sudo systemctl enable simplestatefulfirewall.timer
    sudo systemctl start simplestatefulfirewall.timer

    echo "
    	 Script will automatically run after disconect or connect event in any existing
	 Network Manager connection, at ~1m after boot,
	 and set persistent iptables rules with new sysctl settings for system and network.
	 Create some problems with tools like docker, lxc, and in some vpc, developed and tested
	 ONLY for using at every day desktop/worksation with isolated development boxes.
	 Have some compability with STEAM but in some cases block 'magic' on lo.
 
    	 run	 - sudo systemctl start simplestatefulfirewall.service
	 restart - sudo systemctl restart simplestatefulfirewall.service
	 "
}
