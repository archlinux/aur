# Maintainer: Yusuf Aktepe <yusuf@yusufaktepe.com>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Pierre Chapuis <catwell at archlinux dot us>
# Contributor: Ray Kohler <ataraxia937 at gmail dot com>
# Contributor: Michael Witten <mfwitten>
# Contributor: Raphael Proust <raphlalou at gmail dot com>

pkgname=surf
pkgver=2.1
pkgrel=2
pkgdesc='A simple web browser based on WebKit/GTK+.'
arch=('x86_64')
url='https://surf.suckless.org/'
license=('MIT')
depends=('webkit2gtk' 'gcr' 'xorg-xprop')
optdepends=('dmenu: URL-bar'
            'ca-certificates: SSL verification'
            'xterm: default download handler'
            'curl: default download handler')
makedepends=('git')
install='surf.install'
_commit=d75c3ded0b1ebb8e2778961c5a928f247798686a
source=("git+git://git.suckless.org/surf#commit=$_commit"
        "config.h")
sha256sums=('SKIP'
            '02a630a13d800c4baf3dd8eab8712c38de071ee15f8b6820942828cd2b1958a1')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $pkgname
  cp "$srcdir/config.h" config.h
}

build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname

  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

