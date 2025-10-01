# Maintainer: mmoya <mmoya at mmoya dot org>

_pkgname=nym-binaries
pkgname="${_pkgname}-bin"
pkgver=2025.16
_pkgvername=halloumi
pkgrel=1
pkgdesc="The Nym Privacy Platform binaries"
arch=('x86_64')
url="https://github.com/nymtech/nym"
license=('Apache-2.0')
options=('!debug')
_sources=(
    nym-api                 60ee14fc3249bc4d3433666ccb53408c9bd687188809992690c9036b18b8daa8
    nym-cli                 19580755a5874be648178437ea102ccbee29d455717d1513ef4bb0a49b359e55
    nym-client              d49d6d6a9040c58c952e04fd67f7e984fd18f788e62b5f2c5cb7e3c10ed336a4
    nym-network-requester   e4f058291814cf5bdb437f406be6c9560347059f97e6bda4d5b7fc3c3a0b7429
    nym-socks5-client       8ffb1034ad2637065c26758abdf306123afe3944b34e46dba45e62f2ab5259b9
    nymvisor                334a55dc4523d15a46eaabbf5230925cb124c0f3d989516c490d68417739c005
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
