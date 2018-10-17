# Contributor: Benedikt Heine <bebe@bebehei.de>
# Maintainer: Felix Buehler <account@buehler.de>

pkgname=linux-akulm
pkgver=0.3.1
pkgrel=1
pkgdesc="Pacman hooks to have loadable modules after pacman -Syu"
arch=('any')
url="https://github.com/bebehei/akulm"
license=('GPL3')
depends=('pacman')
source=(
	'https://raw.githubusercontent.com/bebehei/akulm/master/akulm'
	'https://raw.githubusercontent.com/bebehei/akulm/master/akulm-pre.hook'
	'https://raw.githubusercontent.com/bebehei/akulm/master/akulm-post.hook'
	'https://raw.githubusercontent.com/bebehei/akulm/master/akulm.tmpfiles'
)
# Skip checksumming, as these files are
# currently tracked int the same gitrepo
sha256sums=(
	'e0e983fc0d4aa8d1b29067c910f54b3ebac58c7b747b0f89faebd65d950ee23c'
	'97bc51dc561f452fcd2787c043bf62a601c22d92709a85798bc2bb8b7c997501'
	'05197826426c7e2b7908bab03230f44890a97eecf34aa598feb042304b71e574'
	'e63d8e4704e8dd50b7fa14dd23f7c8cf6c63acac82b8d25b696489211d794e78'
)


package() {
	cd "${srcdir}"

	for hook in akulm-pre akulm-post; do
		install -Dm644 "${hook}.hook" "${pkgdir}/usr/share/libalpm/hooks/${hook}.hook"
	done

	install -Dm644 "akulm.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/akulm.conf"

	install -Dm755 "akulm" "${pkgdir}/usr/bin/akulm"
}

