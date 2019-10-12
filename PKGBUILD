# Maintainer: basigur

pkgname=mcos-mjv-xfce-edition
_pkgname=McOS-MJV-XFCE-Edition
pkgver=2.3r5.6435c39
_pkgver=2.3
pkgrel=2
pkgdesc="It's GTK2,GTK3,XFCE4,NOTIFYD theme Mac OS created PaulXFCE"
arch=('any')
url="https://github.com/paullinuxthemer/McOS-MJV-XFCE-Edition"
license=('GPL2')
depends=('gtk-engine-murrine')
replaces=('mcos-mjv-gtk-theme')
conflicts=('mcos-mjv-gtk-theme')
makedepends=('git')
source=("${_pkgname}::git+https://github.com/paullinuxthemer/${_pkgname}" "mjv-xfce.patch")

sha512sums=('SKIP'
            '8d0ce73a9f0766f069006cd40c956503f93725632c43b7032ef1ab8654c6c1101cee791a5ecef5872c3bee931b339529f65c83f95550412a22b5e66176cc65e2')


pkgver() {
  cd "${_pkgname}"

  echo "2.3r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}


prepare() {
  cd "${srcdir}/${_pkgname}"
  patch -Np1 -i "${srcdir}"/mjv-xfce.patch
}


package(){
  cd "${srcdir}/${_pkgname}"
    mv McOS-MJV-Dark-XFCE-Edition-"${_pkgver}" McOS-MJV-Dark-Xfce
    mv "${_pkgname}"-"${_pkgver}" McOS-MJV-Light-Xfce
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" {'README.md','McOS-MJV-Light-Xfce/READ ME'}
    rm -r */{'READ ME','COPYING'}
    install -d "${pkgdir}/usr/share/themes"
    cp -r {'McOS-MJV-Dark-Xfce','McOS-MJV-Light-Xfce'} "${pkgdir}"/usr/share/themes/
}

