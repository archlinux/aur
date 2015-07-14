# Maintainer: Vincent Post <vincent.post@w1r3.net>

pkgname=tshock
pkgver=4.3.5
# Because of tag 4.2200 is 4.2.2.1228 and tag 4.2202 is 4.2.2.0224 epoch must be 1
epoch=1
pkgrel=2
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
            'ea25422690dfb8a15436529b56d594530d3a1d4800f337460f70c46b9328bef1ce6898c25f87d5dbc6a33c36ffc18648a189903650581b4529a5db366c50a705'
            '563ada981c2e08293462485fd85b2c4e0b190c55ed3bcea4139b955f931d970d97c2bd89fba5b190231e9f2adeddd2c385abd11781bf1a98b13b78b8951bf623')

install=tshock.install

package() {
	install -d "${pkgdir}/srv/tshock/ServerPlugins/"
	install -d "${pkgdir}/etc/conf.d/tshock/"
	echo "BASEDIR=/srv/tshock
PORT=7777
WORLDDIR=Terraria/Worlds
WORLD=World1
SIZE=2" > "${pkgdir}/etc/conf.d/tshock/default.conf"

	install -Dm755 "${srcdir}/tshock.sh" "${pkgdir}/srv/tshock/"
	install -Dm644 "${srcdir}/tshock@.service" "${pkgdir}/usr/lib/systemd/system/tshock@.service"

	install -Dm644 "${srcdir}/ServerPlugins"/* "${pkgdir}/srv/tshock/ServerPlugins/"
	install -Dm644 "${srcdir}/sqlite3.dll" "${pkgdir}/srv/tshock/"
	install -Dm644 "${srcdir}/Newtonsoft.Json.dll" "${pkgdir}/srv/tshock/"
	install -Dm644 "${srcdir}/TerrariaServer.exe" "${pkgdir}/srv/tshock/"
}
