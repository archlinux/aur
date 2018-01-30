# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Roman Kyrylych <roman@archlinux.org>
# Contributor: Michal Kaliszka <desmont@gmail.com>
# Contributor: Zsolt Varadi <sysop_xxl@fibermail.hu>
# Contributor: Holger Rauch < holger dot rauch at posteo dot de >

pkgname=tea
pkgver=44.1.0
pkgrel=2
pkgdesc="A Qt-based text editor for Linux and *BSD. With an ultimate small size TEA provides you hundreds of functions."
arch=('x86_64')
url="http://semiletov.org/tea/"
license=('GPL')
depends=('qt5-base' 'qt5-declarative' 'gcc-libs' 'aspell' 'hunspell')
install=tea.install
DLAGENTS=("http::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")
source=(http://semiletov.org/tea/dloads/tea-$pkgver.tar.bz2
        tea.desktop)
sha256sums=('28b665a4ab30defa6699f8625a771612c6e0ae3160abf19e0e3d0a3778599890'
            '6bf04a66bce5a2396eadaee9c7ac7972f24670bbadf855c52146dce0e13f1324')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i 's|/usr/local|/usr|g' src.pro
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export LANG="en_US.UTF-8"
  export LC_ALL="en_US.UTF-8"
  qmake-qt5
  make
}

package(){
  cd "${srcdir}/${pkgname}-${pkgver}"
  export LANG="en_US.UTF-8"
  export LC_ALL="en_US.UTF-8"
  make INSTALL_ROOT="${pkgdir}" install
  install -Dm644 "${srcdir}/tea.desktop" "${pkgdir}/usr/share/applications/tea.desktop"
  install -Dm644 icons/tea_icon_v2.png "${pkgdir}/usr/share/pixmaps/tea.png"
}
