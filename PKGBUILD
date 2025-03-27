# Maintainer: Diab Neiroukh <public at thezest dot dev>

pkgname="mozilla-conf-openssh"
pkgver="20250327"
pkgrel=3
arch=("any")
pkgdesc="Mozilla infosec guidelines configuration for OpenSSH"
url="https://infosec.mozilla.org/guidelines/openssh"
license=("MIT")
depends=(
	"awk"
	"openssh>=6.7"
)
source=(
	"client.conf"
	"server.conf"
)
b2sums=(
	"5e2d05d8db7d3b0bb07e24224e196bd855182d4c7d0bb52904ccb817338aa7e388bd0aed3331ffccea51d4749f616d605341dd5e535cf893de1f4700acd5d99d"
	"fa7c565012b3f2900f53d102e4b22a5363948256a2e9f3d69886e724ec33d508329445e3a15ea6b86d249e8c804e250e5a2089ba4620f65753cde03fa6160f3a"
)

package() {
	install -D -m644 "client.conf" "$pkgdir/etc/ssh/ssh_config.d/98-mozilla.conf"
	install -D -m644 "server.conf" "$pkgdir/etc/ssh/sshd_config.d/98-mozilla.conf"
}

post_install() {
	awk '$5 >= 3071' "/etc/ssh/moduli" > "/etc/ssh/moduli.tmp" && mv "/etc/ssh/moduli.tmp" "/etc/ssh/moduli"
}
