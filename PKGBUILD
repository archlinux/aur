#
# Arch Linux PKGBUILD for wg_tool 
# This builds the latest release tag.
# git HEAD is also well tested.
#
# Maintainer: Gene C <arch@sapience.com>
# Contributor: 
# 
pkgname='wg_tool'
pkgdesc='Wireguard VPN administration tool'
_gitname='wg_tool'

pkgver="10.2.0"
pkgrel=1
url="https://github.com/gene-git/wg_tool"

arch=(any)
license=('GPL-2.0-or-later')
depends=(
    'python>=3.14' 
    'python-cryptography' 
    'py-cidr'
    'python-qrcode' 
    'wireguard-tools' 
    'nftables'
    'pyconcurrent' 
    'python-yaml'
    'python-dnspython'
    'python-tomli-w'
    'bash'
)

optdepends=(
    'wg-client: For post-up.sh, post-dn.sh and resolv-manager'
    'python-argcomplete: For command line option completion'
)

makedepends=(
    'git' 
    'meson'
    'meson-python'
    'rsync'
)

_mkpkg_depends=(
    'python>minor'
    'wireguard-tools>minor'
    'python-cryptography>minor'
    'nftables>minor'
    'py-cidr>minor'
)

#
# Verifying Signed Tag
#   Add arch@sapience.com key to keyring then use the source line with "?signed"
#   Key available via keys/pgp, WKD or dowload from https://www.sapience.com/tech
#   Note that upstream release procedure requires every tagged release have new tag
#
validpgpkeys=( '7CCA1BA66669F3273DB52678E5B81343AB9809E1')   # Gene C

#source=("git+https://github.com/gene-git/${_gitname}#tag=${pkgver}?signed")
source=(
    "git+https://github.com/gene-git/${_gitname}#tag=${pkgver}"
    wg_tool.tmpfiles
)
sha256sums=(
    'SKIP'
    'f05717b55bffbb1a07553c8daddfcfda7749e3508100a96ba1d04793b77f756c'
)

changelog="Changelog.rst"

build() {
    cd "${_gitname}"
    ./scripts/do-build
}

package() {
    cd "${_gitname}"
    ./scripts/do-install ${pkgdir}

    install -Dm644 ../wg_tool.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/wg_tool.conf

}
