# Maintainer: revel <revelΘmuub·net>
# Contributor: jwwolf <jwwolf+arch@gmail.com>

pkgname=onioncat
pkgver=4.10.0
pkgrel=1
pkgdesc='OnionCat is a VPN-adapter, which uses Tor or I2P as its transport.'
arch=('i686' 'x86_64')
url='https://www.onioncat.org/'
license=('GPL3')
depends=('tor' 'net-tools')
#source=("https://www.cypherpunk.at/ocat/download/Source/current/${pkgname}-${pkgver}.tar.gz"{,.asc,.sha256,.sig})
source=("https://github.com/rahra/onioncat/archive/refs/tags/v${pkgver}.tar.gz")
validpgpkeys=('98678E06063007E4A1F0B9C59BD601668E24F29D') # Bernhard R. Fischer (Eagle) <bf@abenteuerland.at>

#sha512sums=('b76da22051907e99f9a6ae6e089d5eb83502b6e3deb096ef00e4d2ed02da1c09b0aba1ad00c85e45622f92c94ba866930840b51b5859d775229606f40b463c59'
#            'SKIP'
#            'SKIP'
#            'SKIP')
sha512sums=('5a2999947edcf6dea46f66c2eed1980604ccb30e49e7bdbcd22fd6c961dc8751bac0c0d4b5b26b51b689f8dfaae893c86579b24341002c41626582f16d2431eb')

build() {
    cd "${pkgname}-${pkgver}"
    ./autogen.sh
    ./configure --prefix=/usr --localstatedir=/var/lib --runstatedir=/run --sysconfdir=/etc
    make
}

package() {
    cd "${pkgname}-${pkgver}"
#    make DESTDIR="$pkgdir" prefix="$pkgdir" install
    make prefix="$pkgdir/usr" exec_prefix="$pkgdir/usr" localstatedir="$pkgdir/var/lib" install
}
