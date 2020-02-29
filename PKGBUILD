# Maintainer: Matthias Lisin <ml@visu.li>
_pkgname=golangci-lint
pkgname=${_pkgname}-bin
pkgdesc="Linters Runner for Go. 5x faster than gometalinter. (Binary)"
pkgver=1.23.7
pkgrel=1
arch=(x86_64 i686 aarch64 arm6h arm7h)
url=https://github.com/golangci/golangci-lint
license=('GPL3')
provides=('golangci-lint')
conflicts=('golangci-lint' 'golangci-lint-git')

_source=${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux
source_x86_64=(${_source}-amd64.tar.gz)
source_i686=(${_source}-386.tar.gz)
source_aarch64=(${_source}-arm64.tar.gz)
source_arm6h=(${_source}-armv6.tar.gz)
source_arm7h=(${_source}-armv7.tar.gz)
sha512sums_x86_64=('153c77739806d975249b32f1722f7b830e29e4eed3593e39bc2da96d6d622d72a7171c09c0df29a14ffd118d39117eb2c64386b6e1056f84645c48d6f2b08716')
sha512sums_i686=('20a476b8d56fdb1c17d9aa50227b671581bf098230de92db42e976e288d7df76694e6d4082ae89ac44ab2a063edf066a99685f034ad1ef3f98ed74c19c68c8cb')
sha512sums_aarch64=('b6f52de8f02acab12df1575c4388014e8ccbfe89ba7956a902ee6e49c5a4ca1390419172b532a1078872afe7050b077584587a676104dbdab29ec6d82c2546ca')
sha512sums_arm6h=('e8b670555330a7a842a1e131c2899eb4e87e41eca81b4862394e8fdd6f98606f0891d419da1bd22782f6568c9063c292260eec478a0560bf9071275677047c2d')
sha512sums_arm7h=('04a58cc0a58aad6a5720f2b6c4cddf783cbb37818906434815df099ebbe580eda13a5d64c306ed7cbeb73fae2c94e54f9e381ff5815860cbaf5acf38dc0d3323')


case $CARCH in
    i686) _suffix=386 ;;
    x86_64) _suffix=amd64 ;;
    aarch64) _suffix=arm64 ;;
    arm6h) _suffix=armv6 ;;
    arm7h) _suffix=armv7 ;;
esac

package() {
    install -dm755 "$pkgdir"/usr/share/{bash-completion/completions,zsh/site-functions}
    install -Dm755 "${_pkgname}-${pkgver}-linux-${_suffix}/golangci-lint" "$pkgdir"/usr/bin/golangci-lint
    "$pkgdir"/usr/bin/golangci-lint completion bash > "$pkgdir"/usr/share/bash-completion/completions/golangci-lint
    "$pkgdir"/usr/bin/golangci-lint completion zsh > "$pkgdir"/usr/share/zsh/site-functions/_golangci-lint
}
