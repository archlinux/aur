# Maintainer: mmoya <mmoya at mmoya dot org>

_pkgname=nym-binaries
pkgname="${_pkgname}-bin"
pkgver=2025.8
_pkgvername=tourist
pkgrel=1
pkgdesc="The Nym Privacy Platform binaries"
arch=('x86_64')
url="https://github.com/nymtech/nym"
license=('Apache 2.0')
_sources=(
    nym-api                 3ef3b20fc66272120f7a581c6185df8cfe90d8f1f589064dffcb196b225148dc
    nym-cli                 08d65e5ca8c109507087ab7cfbf0f5b690becbbade8f6b10ba79c0117d13589f
    nym-client              26ece0c55b7b6ec891dbcacbad6c05917674d96c79daae4b1f5efc91713993b4
    nym-network-requester   02f7ba7f55bdc33e29a0973afe31fb21aa9ef2a405114f406e55bde95c6f7433
    nym-node                1a0db49e5c4f1c7c859645cefe3f03b9fc9ba0e8fac47230c87592e37dfbf01c
    nym-socks5-client       f02c10c63f0570bacd8cf3dc5a5e62d189a6e16dfa726343f9b8b974ff33ab26
    nymvisor                81570b9b613468c35e66ca0993e27ffcd4745b4f91e39299c03cb99a9f8c53a4
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
