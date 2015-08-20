# $Id:$
# Contributor: (sirocco AT ngs.ru)
# Maintainer: (sirocco AT ngs.ru)

pkgname=doublecmd-gtk2-alpha-bin
_pkgname=doublecmd
pkgver=0.7.0.svn.r6184
_pkgver=0.7.0~0+svn6184
pkgrel=1
pkgdesc="Double Commander is a cross platform open source file manager with two panels side by side. It is inspired by Total Commander and features some new ideas."
arch=('i686' 'x86_64')
url='http://doublecmd.sourceforge.net'
# https://launchpad.net/~alexx2000/+archive/doublecmd-svn
depends=('gtk2')
optdepends=('lua: scripting' 'p7zip: support for 7zip archives' 'libunrar: support for rar archives'
            'pmount: mount removable devices' 'imagemagick: speed up thumbnail view')
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
sha256sums=('7e13bd8f3f4c84752d17c4a89c814cd4c917c182d9f48a4da8ff4722edf7a190')
sha256sums_i686=('e8e9d91a93190551e32f2d7fe092d83c6a7bc43780eb36f3c4c8930c31d42268'
                 'cdb287aa20954cb8025a54e44a68b68aa3ac47dd2a38f23f4490cfc4f821fd6f')
sha256sums_x86_64=('84b601f440cd25f393213565f4d7533a06e349f2d63adda7bad2c0179ed8d340'
                   '9445093cda678666b471216060a6a96c8f8ba624959a4f9efa07cefff26b71f5')

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

