# Maintainer: J0k3r <moebius282 at gmail dot com>

pkgname=darkplaces-rm-git
pkgver=r8985.0b519b1
pkgrel=1
pkgdesc="DarkplacesRM is a fork of the DarkPlaces engine compatible with the RocketMinsta project"
url="http://rocketminsta.net/"
license=('GPL2')
arch=('x86_64' 'i686')
## not specified in the elf, but still required
depends=('libjpeg')
## additional depends of the sdl version
depends+=('sdl')
## additional depends of the glx version
depends+=('alsa-lib' 'libxpm' 'libxxf86vm')
optdepends=('libircclient: for irc support')
## mesa for GL/glx.h
makedepends=('git' 'mesa')
changelog="${pkgname}.changelog"
conflicts=('darkplaces_rm-git')
replaces=('darkplaces_rm-git')
_local_repo="${pkgname}"
_binary_basename="darkplaces-rm"
source=("${_local_repo}::git+https://github.com/nexAkari/DarkPlacesRM.git"
        "${pkgname}.changelog")
sha256sums=("SKIP"
            "SKIP")

function pkgver
{
	cd "${srcdir}/${_local_repo}/"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

function build
{
	cd "${srcdir}/${_local_repo}/"

	make sv-release sdl-release cl-release
}

function package
{
	cd "${srcdir}/${_local_repo}/"

	install -d "${pkgdir}/usr/bin/"
	install -t "${pkgdir}/usr/bin/" "${_binary_basename}-dedicated" "${_binary_basename}-sdl" "${_binary_basename}-glx"
}
