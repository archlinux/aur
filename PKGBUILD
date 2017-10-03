# Maintainer: Your Name <youremail@domain.com>
_pkgname=red-discordbot
pkgname="${_pkgname}-git"
pkgver=r640.39a0f25
pkgrel=1
pkgdesc="Red - A fully customizable Discord bot"
arch=(any)
url="https://github.com/Cog-Creators/Red-DiscordBot"
license=('GPL')
depends=('python' 'python-pip' 'git'  'openssl' 'libffi' 'libsodium' 'python-discord')
optdepends=('ffmpeg: voice'
	    'python-imgurpython: images cog')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/Cog-Creators/Red-DiscordBot#branch=develop"
	"${_pkgname}.sysusers"
	"${_pkgname}.service")
sha256sums=('SKIP'
            '64bf000274890f04051d18310de64c1a5e76cfea798591ffb2a5db29a2a306e5'
            '707399f1f759b4562f5f06f2d7501bc0b6c77db5a7e4a14aedc4ca1be4914b4e')

pkgver() {
	cd "$srcdir/${_pkgname}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${_pkgname}"

	install -Dm644 "${srcdir}/${_pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
	install -Dm644 -t "${pkgdir}/usr/lib/systemd/system/" "${srcdir}/${_pkgname}.service"
	install -Dm644 -t "${pkgdir}/opt/${_pkgname}" launcher.py red.py
	cp -r cogs data "${pkgdir}/opt/${_pkgname}"

	chown -R 857:857 "${pkgdir}/opt/${_pkgname}"
}
