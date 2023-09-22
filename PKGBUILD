# Maintainer: Chimmie Firefly <gameplayer2019pl (at) tutamail (dot) com>
pkgname=gitio-git
_pkgname=gitio-git
pkgver=0
pkgrel=1
pkgdesc='Frontend API for interacting with git hosting for CI.'

arch=(
	'any'
)

url="https://gitio.chimmie.k.vu"
license=('Akini 3.1')

depends=(
    'openssl'
    'coreutils'
    'git'
    'sed'
    'gawk'
    'curl'
)

optdepends=(
    'kaniko: Build containers'
    'openssh: SSH based auth using git'
)

makedepends=(
    'pacman'
)

provides=(
	'gitio'
)

conflicts=(
	'gitio'
)

source=(
    "https://gitio.chimmie.k.vu/packages/zst/pkg.tar.gz"
)

noextract=("pkg.tar.gz")

sha256sums=(
    'SKIP'
)

pkgver() {
    cd "${srcdir}"
    echo 'r'"$(sha256sum pkg.tar.gz | cut -d ' ' -f 1)"
}

build() {
	cd "${srcdir}"
	tar -xvf pkg.tar.gz
    mv default-fs "${pkgname}"
    
}

package() {
    cd "${srcdir}"
	cd "${srcdir}/${pkgname}"
    mkdir -p "${pkgdir}" 2>/dev/null 3>&2
    cp -rv * "${pkgdir}/"
    chmod +x "${pkgdir}"/usr/bin/*
}
