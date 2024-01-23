# Maintainer: Viktor Ricci <ricci@primateer.de>

pkgname=('poddl-git')
_gitname=('poddl')
pkgver=2023.10.16
pkgrel=1
pkgdesc="Podcast Downloader - Download all podcasts / episodes from an RSS-feed"
url="https://github.com/freshe/poddl"
license=('MIT')
source=('git+https://github.com/freshe/poddl.git')
b2sums=('SKIP')
arch=('x86_64')
depends=('gcc-libs' 'glibc' 'curl')
makedepends=('git')
checkdepends=()
provides=('poddl')
conflicts=('poddl')
_sample_rss='https://gist.githubusercontent.com/rodydavis/d0cb7a53d8deb42e92ae803a9dd48dbc/raw/94c3a5bef2c662122d3663e0c27e7db2d7fe2cd7/podcast_rss_feed.xml'

pkgver(){
    cd "${srcdir}/${_gitname}"
    grep -hoP '#define VERSION "\K[^"]+' *.cpp *.hpp
}

build(){
    cd "${srcdir}/${_gitname}"
    g++ *.cpp -O2 -std=c++11 -lcurl -o "${_gitname}"
}

check(){
    cd "${srcdir}/${_gitname}"
    ./"${_gitname}" "${_sample_rss}" -l
}

package(){
    cd "${srcdir}/${_gitname}"
    install -Dm755 "${_gitname}" "${pkgdir}/usr/bin/${_gitname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
