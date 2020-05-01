# Maintainer: Yusuf Aktepe <yusuf@yusufaktepe.com>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Pierre Chapuis <catwell at archlinux dot us>
# Contributor: Ray Kohler <ataraxia937 at gmail dot com>
# Contributor: Michael Witten <mfwitten>
# Contributor: Raphael Proust <raphlalou at gmail dot com>

pkgname=surf
pkgver=2.0
pkgrel=2
pkgdesc='A simple web browser based on WebKit/GTK+.'
arch=('x86_64')
url='https://surf.suckless.org/'
license=('MIT')
depends=('webkit2gtk' 'xorg-xprop')
optdepends=('dmenu: URL-bar'
            'ca-certificates: SSL verification'
            'xterm: default download handler'
            'curl: default download handler')
makedepends=('git')
install='surf.install'
_commit=b814567e2bf8bda07cea8de1c7a062f4aa437b65
source=("git+git://git.suckless.org/surf#commit=$_commit"
        'config.h')
sha256sums=('SKIP'
            '3a746f6f3a48e42b1779686421cf6b34157292e34e571b67de8d614c3ea1565c')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --tags | sed 's/-/+/g' | sed 's/0.6/0.7/'
}

build() {
  cd "${srcdir}/${pkgname}"

#  cp "${srcdir}/config.h" config.h

  sed -i 's/CPPFLAGS =/CPPFLAGS +=/g' config.mk
  sed -i 's/CFLAGS =/CFLAGS +=/g' config.mk
  sed -i 's/LDFLAGS =/LDFLAGS +=/g' config.mk

  make
}

package() {
  cd "${srcdir}/${pkgname}"

  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
