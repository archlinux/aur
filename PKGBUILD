# Maintainer: Matthias Lisin <ml@visu.li>
_pkgname=golangci-lint
pkgname=${_pkgname}-bin
pkgdesc="Linters Runner for Go. 5x faster than gometalinter. (Binary)"
pkgver=1.21.0
pkgrel=1
# aarch64 not available for v1.21.0 (yet)
# https://github.com/golangci/golangci-lint/issues/823
arch=(x86_64 i686 arm6h arm7h) 
url=https://github.com/golangci/golangci-lint
license=('GPL3')
provides=('golangci-lint')
conflicts=('golangci-lint' 'golangci-lint-git')

_source=${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux
source_x86_64=(${_source}-amd64.tar.gz)
source_i686=(${_source}-386.tar.gz)
#source_aarch64=(${_source}-arm64.tar.gz)
source_arm6h=(${_source}-armv6.tar.gz)
source_arm7h=(${_source}-armv7.tar.gz)
sha512sums_x86_64=('1e48e9ab9683e297418002df282818ee8e7894d711beba0147fcca756ef54e732f50ac8207f140072157e9391b4773ec2badf741a43eb9371884b292cc8e2cf0')
sha512sums_i686=('b5f41cada6dd0595c2b1574d3eb24065ae5cbc8569a11f289e0bb88d9a231fdf8839248e63106f0e7b07ce919f79b75d9a9fca36d5072992ab2368c25028fd1d')
sha512sums_arm6h=('da1c9016963ff8cff556796314b9e78df4cbf4876a3361701b76b30fcc4bb4471f74c99b5c342d97ad3137a8cfe7e2bfbe43f4df7b6d5d653f3b73e5e7005ce1')
sha512sums_arm7h=('38fe8ade767bf67064e3e1b6729f1bdc9ea7ef0251967ac706932c6ee18faa05dfbbff5530e8d9c6a2097f2db6d8e3858c9ede5a457f5e322107a373af629b23')
#sha512sums_aarch64=('1595297bbe24769a888f36cde9af4edfe179d32641f33249a636db43bcb96b9b8a4f8fccceec8ae4ecce3a8700efa5799e547bc8a6ebd22ab55ccb86915e3cb8')


case $CARCH in
    i686) _suffix=386 ;;
    x86_64) _suffix=amd64 ;;
    aarch64) _suffix=arm64 ;;
    arm6h) _suffix=armv6 ;;
    arm7h) _suffix=armv7 ;;
esac

package() {
    install -Dm755 "${_pkgname}-${pkgver}-linux-${_suffix}/golangci-lint" "$pkgdir/usr/bin/golangci-lint"
}
