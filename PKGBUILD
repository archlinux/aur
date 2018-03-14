# $Id:$
# Contributor: (sirocco AT ngs.ru)
# Maintainer: (sirocco AT ngs.ru)

pkgname=doublecmd-gtk2-alpha-bin
_pkgname=doublecmd
pkgver=0.9.0.svn.r8027
_pkgver=0.9.0~0+svn8027
pkgrel=1
pkgdesc="A file manager with two panels side by side"
arch=('i686' 'x86_64')
url='https://doublecmd.sourceforge.io'
# https://launchpad.net/~alexx2000/+archive/doublecmd-svn
depends=('gtk2')
optdepends=('lua51: scripting' 'p7zip: support for 7zip archives' 'libunrar: support for rar archives'
            'pmount: mount removable devices' 'imagemagick: speed up thumbnail view' 'ffmpegthumbnailer: video thumbnails')
provides=('doublecmd')
replaces=('doublecmd-gtk2-bin-nightly')
conflicts=('doublecmd-gtk2' 'doublecmd-qt-svn' 'doublecmd-qt' 'doublecmd-gtk2-svn' 'doublecmd-gtk2-bin-nightly')
license=('GPL2')
options=('!strip')

_bldarch=amd64
[[ $CARCH = i686 ]] && _bldarch=i386

_url=http://download.opensuse.org/repositories/home:/Alexx2000:/doublecmd-svn/xUbuntu_17.10
source=(${_url}/all/${_pkgname}-common_${_pkgver}_all.deb)
source_i686+=(${_url}/i386/${_pkgname}-gtk_${_pkgver}_i386.deb
        ${_url}/i386/${_pkgname}-plugins_${_pkgver}_i386.deb)
source_x86_64+=(${_url}/amd64/${_pkgname}-gtk_${_pkgver}_amd64.deb
        ${_url}/amd64/${_pkgname}-plugins_${_pkgver}_amd64.deb)
sha256sums=('9c1d3fa261ee95bbdef782628f61d2eee45db5bf2ea9ee303086b1fb6d8e96d9')
sha256sums_i686=('1401664e716da760ebf0ea680ad5071ec7a42e16ab63a9592044d3915d4e5497'
                 'c5021afe7595c1282f01876359561f7eaafbcf317c664f4b2061a10ec92409ec')
sha256sums_x86_64=('d3d65172221e91bb634034ec0fdcd95d9dd32233611f5a5293369c9e2535122f'
                   '01841d8d7a63fb6ad2095c1f754bcb16e07926d32231fe1ce3a9423fa1e219bf')

noextract=(
   ${_pkgname}-gtk_${_pkgver}_${_bldarch}.deb
   ${_pkgname}-plugins_${_pkgver}_${_bldarch}.deb
   ${_pkgname}-common_${_pkgver}_all.deb
)



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

