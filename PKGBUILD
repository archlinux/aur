# Maintainer: Bailey Kasin <bailey@gingertechnology.net> (https://angrysysadmins.tech)

pkgname=gogios-bin
pkgver=3.0.0
pkgrel=1
pkgdesc="Checks to see if required services are still running on important machines."
arch=('x86_64')
url="https://angrysysadmins.tech"
license=('MIT')
optdepends=(
	'nmap'
	'sqlite'
	'nginx'
	'gogios-plugins'
)
source=("https://github.com/BKasin/gogios/releases/download/${pkgver}/gogios-${pkgver}-${pkgrel}-${arch}.pkg.tar.xz")
options=('!strip' '!emptydirs')
install=${pkgname}.install
noextract=("gogios-${pkgver}-${pkgrel}-${arch}.pkg.tar.xz")
sha256sums=('b7a0f1289ab2f8e5ce47862e68e76ea9978b042894afd82c866d8643aca02314')
provides=('gogios')
conflicts=('gogios')

backup=(etc/gogios/{gogios.toml,checks.json})
NoUpgrade=/etc/gogios/gogios.sample.toml

package() {
    tar -xf gogios-${pkgver}-${pkgrel}-${arch}.pkg.tar.xz -C "${pkgdir}"
    rm "${pkgdir}"/{.MTREE,.PKGINFO,.INSTALL}

    # Permission fix
    find "${pkgdir}" -type d -exec chmod 755 {} +
}
