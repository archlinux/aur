# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Roman Kyrylych <roman@archlinux.org>
# Contributor: Michal Kaliszka <desmont@gmail.com>
# Contributor: Zsolt Varadi <sysop_xxl@fibermail.hu>
# Contributor: Holger Rauch < holger dot rauch at posteo dot de >

pkgname=tea
pkgver=47.0.1
pkgrel=3
pkgdesc="A Qt-based text editor for Linux and *BSD. With an ultimate small size TEA provides you hundreds of functions."
arch=('x86_64')
url="http://semiletov.org/tea/"
license=('GPL')
depends=('qt5-base' 'qt5-declarative' 'gcc-libs' 'aspell' 'hunspell')
install=tea.install
DLAGENTS=("http::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")
source=(http://semiletov.org/tea/dloads/tea-$pkgver.tar.bz2
        tea.desktop)
sha256sums=('5fb5c22023edd26ed8d0708a737df2cfdb2a88abe546e2e6f020acfe19d3e764'
            '6bf04a66bce5a2396eadaee9c7ac7972f24670bbadf855c52146dce0e13f1324')
sha512sums=('c58099b1c2d89e86ec24db40aee129f1936b8ab7f9b2e6628f5473e42954506e6d76169a4bd306953bd0e8d0ad8725e6dafa510a6130f7f42d35ca459e8b7336'
            'f7fee6a36cf5ef60f6bcac36c1a97f104c84b9fbdc7d6269349137c5e107987b87c4f01e22f32568ec6548916cf92696e72352756cfe7747f8744adbeca3d285')

#prepare() {
#  cd "${srcdir}/${pkgname}-${pkgver}"
#  sed -i 's|/usr/local|/usr|g' src.pro
#}

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
