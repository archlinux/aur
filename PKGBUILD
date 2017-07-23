# Maintainer: Andrei Alexeyev <akari@alienslab.net>
# Contributor: J0k3r <moebius282 at gmail dot com>

pkgname=darkplaces-rm-git
pkgver=r11895.399d8be7
pkgrel=1
pkgdesc="A fork of the DarkPlaces engine with various extensions"
url="https://github.com/kasymovga/DarkPlacesRM"
license=('GPL2')
arch=('x86_64' 'i686')
depends=('sdl2' 'zlib')
optdepends=(
    'curl: download missing custom content while playing online, used for other purposes by some games'
    'd0_blind_id-git: encryption support (required for Xonotic)'
    'freetype2: TTF and OTF fonts support (required by some games)'
    'libircclient: IRC integration for supporting games'
    'libjpeg: decode JPEG textures (required by most games)'
    'libmaxminddb: provides ip-to-country resolution for supporting games'
    'libpng: decode PNG textures'
    'libtheora: required for video capture'
    'libvorbis: required for OGG playback (used by most games)'
    'ode: physics engine, may be used by some games'
)
makedepends=('git' 'mesa')
conflicts=('darkplaces_rm-git')
replaces=('darkplaces_rm-git')
_local_repo="${pkgname}"
_binary_basename="darkplaces-rm"
source=("${_local_repo}::git+https://github.com/kasymovga/DarkPlacesRM.git")
sha256sums=("SKIP")

function pkgver
{
    cd "${srcdir}/${_local_repo}/"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

function build
{
    cd "${srcdir}/${_local_repo}/"

    make CPUOPTIMIZATIONS="$CFLAGS" DP_JPEG_VERSION=80 sdl-release sv-release
}

function package
{
    cd "${srcdir}/${_local_repo}/"

    install -d "${pkgdir}/usr/bin/"
    install -t "${pkgdir}/usr/bin/" "${_binary_basename}-dedicated" "${_binary_basename}-sdl"
}
