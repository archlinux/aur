# Maintainer: Vladimir Panteleev <arch-pkg at thecybershadow.net>
# Contributor: noonov <noonov@gmail.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: damir <damir@archlinux.org>

_pkgname=uim
pkgname=${_pkgname}-git
pkgver=1.8.0.alpha.r264.gfe60773
pkgrel=1
epoch=1
pkgdesc='Multilingual input method library'
url='https://github.com/uim/uim/wiki'
license=('custom:BSD')
arch=('i686' 'x86_64')
depends=('libxft' 'libedit' 'm17n-lib')
makedepends=('intltool' 'gettext' 'gtk2' 'gtk3' 'qt4' 'anthy')
optdepends=('qt4: immodule and helper applications'
            'gtk2: immodule and helper applications'
            'gtk3: immodule and helper applications')
provides=('uim')
conflicts=('uim' 'uim-svn')
source=("git+https://github.com/uim/uim.git")
sha256sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_pkgname}
  git describe --long --tags | sed -r 's/^uim-//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd ${srcdir}/${_pkgname}

  ./configure \
	  --prefix=/usr \
	  --libexecdir=/usr/lib/uim \
	  --with-anthy-utf8 \
	  --with-qt4-immodule \
	  --with-qt4 \
	  --with-qt5 \

  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install -j1 # FS#41112
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
