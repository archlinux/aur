# Maintainer: mmoya <mmoya at mmoya dot org>

_pkgname=nym-binaries
pkgname="${_pkgname}-bin"
pkgver=2023.1
_pkgvername=milka
pkgrel=1
pkgdesc="The Nym Privacy Platform binaries"
arch=('x86_64')
url="https://github.com/nymtech/nym"
license=('Apache 2.0')
_sources=(
    explorer-api            2e843c53d8998f16f42bb96f61ae4a441244d6e285140ee7d87cb2de1d1ae55c
    nym-api                 975506eab74af270a30398435198e00b05f87489b4cade71839a6f33522484f4
    nym-cli                 d88fef42b50e3004d13e49e194365d76fa9620e78c71d77a71d934e009af55ea
    nym-client              2944cd192f74db93e26d3369a53574d1778b0dbc9abda0ee48882e40ff41f1ab
    nym-gateway             6c8e92e03048200308e0724675059c2dfba91d8cb0560857a3a319448bb0bf05
    nym-mixnode             05367420b7b842f1850011e6dbc5fc25e9e794df4695725406171272d7105572
    nym-network-requester   473f6842f58f30f8146964e528d4d604ae35416ecefd94fe860a4ccda596ed50
    nym-network-statistics  51afc9e169289e1a2a0e513e3c7ecbc907fb2cccd2854c821bbf73106d65b413
    nym-socks5-client       a362d6bf1859bf55c38ffdf87e77ee8910f654ca90cb80e3fbef06d3f8ba1002
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
