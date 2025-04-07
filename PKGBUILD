# Maintainer: mmoya <mmoya at mmoya dot org>

_pkgname=nym-binaries
pkgname="${_pkgname}-bin"
pkgver=2025.6
_pkgvername=chuckles
pkgrel=1
pkgdesc="The Nym Privacy Platform binaries"
arch=('x86_64')
url="https://github.com/nymtech/nym"
license=('Apache 2.0')
_sources=(
    nym-api                 c73745feef8e49ddae271b88932528e2df3c0d047fc3f6aeb59221ded4fde8c1
    nym-cli                 7c900f52fdb7a986bdf1dbb538afa67a82a81b971f0ed4cbdc5017f9222ccd35
    nym-client              ad6886f507d14773387934bf3b7f1b1a2b6353643ae99d7ce1811e0a75c74ce1
    nym-network-requester   d9229139dd04bdbd713f21f7c22fa96f9d25231cbc3555dcb5ae9aee23438854
    nym-node                c0abc782e26a4a73ac51524c0b0564182fafbe040028ea53a402259aca1a4a93
    nym-socks5-client       2155fd4482c8c18e7408384cdd576a89e52a1fe39464d65ea0938346f6be5f78
    nymvisor                7b878bf52e00461c31c60e61347f6d912bf73529177f12b5a0867046df1f5fff
)
source_x86_64=()
sha256sums_x86_64=()
for ((i=0; i<${#_sources[*]}; i=i+2)); do
    source_x86_64+=("https://github.com/nymtech/nym/releases/download/nym-binaries-v${pkgver}-${_pkgvername}/${_sources[i]}")
    sha256sums_x86_64+=(${_sources[i+1]})
done

package() {
    for ((i=0; i<${#_sources[*]}; i=i+2)); do
        strip "${_sources[i]}"
        install -Dm755 "${_sources[i]}" "${pkgdir}/usr/bin/${_sources[i]}"
    done
    chmod 755 "${pkgdir}/usr/bin"
}
