# Maintainer: devome <evinedeng@hotmail.com>
# Contributer: maz-1 <ohmygod19993@gmail.com>
# Contributer: plokid <910576949@qq.com>

_dotnet_ver=10.0
_tgtbin="ImeWlConverterCmd"
pkgname=imewlconverter
pkgver=3.4.0
pkgrel=1
pkgdesc="深蓝词库转换：一款开源免费的输入法词库转换程序"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/studyzy/${pkgname}"
license=('GPL-3.0-or-later')
provides=("${pkgname}")
conflicts=("${pkgname}")
replaces=("${pkgname}"{-bin,-cli})
depends=("glibc" "libgcc" "libstdc++")
makedepends=("dotnet-sdk-${_dotnet_ver}")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1cdc6a5f1e3876e9e4daf377520203478f9d38231eebc553016b6a95aca2106b')
options=('!strip')

build() {
    export PACKAGE_VERSION="${pkgver}"

    cd "${pkgname}-${pkgver}"
    dotnet publish "src/${_tgtbin}" \
        --configuration Release \
        --framework "net${_dotnet_ver}" \
        --output . \
        -p:PublishSingleFile=true \
        -p:DebugSymbols=false \
        -p:DebugType=none
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "${_tgtbin}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "README.md"  "${pkgdir}/usr/share/doc/${pkgname}"
}
