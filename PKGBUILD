# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=ssh-studio
pkgver=1.2.3
pkgrel=1
pkgdesc='Easy, GUI SSH config editor and validator built with Python, GTK 4 and libadwaita'
arch=('any')
url='https://github.com/BuddySirJava/SSH-Studio'
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita' 'python-cairo' 'python-gobject')
makedepends=('appstream-glib' 'blueprint-compiler' 'git' 'meson')
source=("${pkgname}::git+https://github.com/BuddySirJava/SSH-Studio.git#tag=${pkgver}"
        "${pkgname}-gresource.patch")
b2sums=('f132560bae370096f635102922f5b090a5e46766b3381964c65c1f43ee7bb84204dc61e607e9f985ba283b5b48f82b09397eba755686501757d67f05224985f7'
        '9544df1ff21520e7dcc849838695118a0b5846e0809ae3a97bf5d00d392499903af8c325405487b0171fdac7fc8a6a35b8b46cc768936e37d9c0417f98abad55')

build() {
  patch -d "${pkgname}" -p1 <"${pkgname}-gresource.patch"
  arch-meson "${pkgname}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
