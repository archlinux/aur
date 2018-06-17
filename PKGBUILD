# Maintainer: Tim van Leuverden <Timmy1e [at] protonmail [dot] ch>

pkgname=rocketchat-server-docker
_pkgname=rocketchat-server
pkgver=0.65.2
pkgrel=2
pkgdesc="An open source web chat platform, docker-compose package for minimal setup."
arch=("any")
conflicts=("rocketchat-server")
url="https://rocket.chat/"
license=("MIT")
depends=(
	"docker"
	"docker-compose"
)
source=(
	"docker-compose.yml"
	"example.env"
	"${_pkgname}.env"
	"${_pkgname}.install"
	"rocketchat.service"
)
sha512sums=(
	"8e40c069434f06769993939fe6c033892c2676f14feb58b98514ed330b41e14cd3851000e78276ac9b48ba25cf8dd069c96abeb636561fa066bec02a241708fe"
	"53f012f89511b7ce0d1b1c8c4e6ac0cc376dfae558619db1728257777abf3d9abd1ac22a7ecb73eaf1feabac3826950352d5ce7b7303e94d6d71c349976d6e29"
	"56146941271dbe8edd2e593392af665f4e39f7f78b48bf93aa21a3bef3886063eb2dd423b31ac1474c435500f7e34722f4eb5641665c643b6344360b2ad37c79"
	"92780bd28014a2cb93b30e392c1dd8a4d3a8fd7903f680c5715bfcbc3135e6d5d44b9ab7fb7b044d0fbdb042c4a7c5a36dade5a0a099db26737f62b94a5ddc03"
	"99200c457924a5c71acc8963cbce447e96836e2f4aa257ab614d1a37181c3ccaeea56dd80785cd7decf2081e66313a5aca50ecc1729f944e6593dbd6746eb650"
)
install="${_pkgname}.install"
package() {
	mkdir -p ${pkgdir}/usr/share/${_pkgname}/data/
	install -Dm644 docker-compose.yml ${pkgdir}/usr/share/${_pkgname}/docker-compose.yml
	install -Dm644 ${_pkgname}.env ${pkgdir}/usr/share/${_pkgname}/${_pkgname}.env
	install -Dm644 rocketchat.service ${pkgdir}/usr/lib/systemd/system/rocketchat.service
	install -Dm644 example.env ${pkgdir}/etc/${_pkgname}/example.env

	echo "x_TAG=${pkgver}" > ${pkgdir}/usr/share/${_pkgname}.env
}

