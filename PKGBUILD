# $Id:$
# Contributor: (sirocco AT ngs.ru)
# Maintainer: (sirocco AT ngs.ru)

pkgname=doublecmd-gtk2-alpha-bin
_pkgname=doublecmd
pkgver=0.7.0.svn.r6378
_pkgver=0.7.0~0+svn6378
pkgrel=1
pkgdesc="Double Commander is a cross platform open source file manager with two panels side by side. It is inspired by Total Commander and features some new ideas."
arch=('i686' 'x86_64')
url='http://doublecmd.sourceforge.net'
# https://launchpad.net/~alexx2000/+archive/doublecmd-svn
depends=('gtk2')
optdepends=('lua: scripting' 'p7zip: support for 7zip archives' 'libunrar: support for rar archives'
            'pmount: mount removable devices' 'imagemagick: speed up thumbnail view' 'ffmpegthumbnailer: video thumbnails')
install="doublecmd.install"
provides=('doublecmd')
replaces=('doublecmd-gtk2-bin-nightly')
conflicts=('doublecmd-gtk2' 'doublecmd-svn' 'doublecmd-gtk2-bin-nightly')
license=('GPL2')
options=('!strip')

_bldarch=amd64
[[ $CARCH = i686 ]] && _bldarch=i386

_url=http://download.opensuse.org/repositories/home:/Alexx2000:/doublecmd-svn/xUbuntu_15.04
source=(${_url}/all/${_pkgname}-common_${_pkgver}_all.deb)
source_i686+=(${_url}/i386/${_pkgname}-gtk_${_pkgver}_i386.deb
        ${_url}/i386/${_pkgname}-plugins_${_pkgver}_i386.deb)
source_x86_64+=(${_url}/amd64/${_pkgname}-gtk_${_pkgver}_amd64.deb
        ${_url}/amd64/${_pkgname}-plugins_${_pkgver}_amd64.deb)
sha256sums=('4233d5e0fe42a28672c22bcb7250aa458b60af230e56a832728e512f06101013')
sha256sums_i686=('da2944817c9781cae660755505fb85545708bf94d3f696a3a078cae9196cc5a3'
                 'f7cd7003435da4e72a551fcf028261c3446013f206f3b194f1bd67d13e90602f')
sha256sums_x86_64=('6d43a1b8a48dff80ed6db7686667be2d7af93e087a314c87944c8c24f6a6e94a'
                   'e1f31931b38c540b14b9b32f8b2634ddf9b198966be29d85710f29f8533c8ccd')

package() {
    msg2 "Extracting files..."
    cd "$srcdir"
    ar x ${_pkgname}-gtk_${_pkgver}_${_bldarch}.deb
    tar xf data.tar.xz --exclude lintian -C $pkgdir
    rm -f data.tar.xz
    ar x ${_pkgname}-plugins_${_pkgver}_${_bldarch}.deb
    tar xf data.tar.xz --exclude lintian -C $pkgdir
    rm -f data.tar.xz
    ar x ${_pkgname}-common_${_pkgver}_all.deb
    tar xf data.tar.xz --exclude lintian -C $pkgdir
    rm -f data.tar.xz

}

