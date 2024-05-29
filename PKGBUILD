# Maintainer: SoftExpert <softexpert at gmail dot com>
_pkgname=dnstrack
pkgname=${_pkgname}-git
pkgver=r5.g4739707
pkgrel=1
pkgdesc="A dns-query tracking tool written in go. dnstrack helps to track all dns query on your machine in real time."
arch=(x86_64)
url='https://github.com/chenjiandongx/dnstrack'
license=('MIT')
provides=(${_pkgname})
conflicts=(${_pkgname})
depends=()
makedepends=('git' 'go')
source=("${_pkgname}::git+https://github.com/chenjiandongx/dnstrack.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}" 
    go get -u github.com/chenjiandongx/dnstrack
    CGO_ENABLED=0
    GOOS=linux
    go build -tags linux -o ${_pkgname}  ./main.go ./cache.go ./dnstrack.go ./pacp_linux.go ./pcap.go
}

package() {
    # cd "${srcdir}/${_pkgname}/bin" 
    install -Dm755 "${srcdir}/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
     
    # cd "${srcdir}/${_pkgname}" 
    install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
