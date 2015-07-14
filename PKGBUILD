# Maintainer: Vincent Post <vincent.post@w1r3.net>

pkgname=tshock
pkgver=4.3.5
# Because of tag 4.2200 is 4.2.2.1228 and tag 4.2202 is 4.2.2.0224 epoch must be 1
epoch=1
pkgrel=1
pkgdesc="A Terraria Server administration modification that runs on the open source TerrariaAPI."
arch=(any)
url="http://tshock.co/xf/"
license=("GPL")
depends=('tmux'
         'mono')
source=("https://github.com/NyxStudios/TShock/releases/download/v${pkgver}/${pkgname}_${pkgver}-release.zip"
        'tshock.sh'
        'tshock@.service')

sha512sums=('b15c1518507a7bf7b700789fb55eb7c2ecc175d1da8585b4d12c118f6f64b8d82a2f72b048d4efc856e841ea48508a925b4717932d045caad5fdd93e3cd60904'
            'bdf5a5a626f071b5a1a9aa60ffbc0f87078cf96a940af7ac6bb99798234a07021eaab61bef72bed0af7c5a821ffccb4eda5a50076e2133ae5643f2f2517e6265'
            '563ada981c2e08293462485fd85b2c4e0b190c55ed3bcea4139b955f931d970d97c2bd89fba5b190231e9f2adeddd2c385abd11781bf1a98b13b78b8951bf623')

install=tshock.install

package() {
	install -d "${pkgdir}/srv/tshock/ServerPlugins/"
	install -d "${pkgdir}/etc/conf.d/tshock/"
	echo "BASEDIR=/srv/tshock
PORT=7777
WORLD=World1" > "${pkgdir}/etc/conf.d/tshock/default.conf"

	install -Dm755 "${srcdir}/tshock.sh" "${pkgdir}/srv/tshock/"
	install -Dm644 "${srcdir}/tshock@.service" "${pkgdir}/usr/lib/systemd/system/tshock@.service"

	install -Dm644 "${srcdir}/ServerPlugins"/* "${pkgdir}/srv/tshock/ServerPlugins/"
	install -Dm644 "${srcdir}/sqlite3.dll" "${pkgdir}/srv/tshock/"
	install -Dm644 "${srcdir}/Newtonsoft.Json.dll" "${pkgdir}/srv/tshock/"
	install -Dm644 "${srcdir}/TerrariaServer.exe" "${pkgdir}/srv/tshock/"
}
